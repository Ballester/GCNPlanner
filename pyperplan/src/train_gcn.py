import argparse
import numpy as np
import sys
sys.path.append("/home/ballester/planning/pygcn")
sys.path.append("/home/ballester/planning/pygcn/pygcn")

import torch
import torch.nn.functional as F
from pygcn.utils import load_data, accuracy
from pygcn.models import GCN

from pygcn.utils import load_data, accuracy
from pygcn.models import GCN, Discriminator
from domain_loader import create_loaders
import grounding
import search
import heuristics
import tools
import time


import os
os.environ["CUDA_VISIBLE_DEVICES"] = "2"

def get_heuristics():
    """
    Scan all python modules in the "heuristics" directory for classes ending
    with "Heuristic".
    """
    heuristics = []
    src_dir = os.path.dirname(os.path.abspath(__file__))
    heuristics_dir = os.path.abspath(os.path.join(src_dir, 'heuristics'))
    for filename in os.listdir(heuristics_dir):
        if not filename.endswith('.py'):
            continue
        module = tools.import_python_file(os.path.join(heuristics_dir, filename))
        heuristics.extend([getattr(module, cls) for cls in dir(module)
                           if cls.endswith('Heuristic') and cls != 'Heuristic' and
                           not cls.startswith('_')])
    return heuristics

def _get_heuristic_name(cls):
    name = cls.__name__
    assert name.endswith('Heuristic')
    return name[:-9].lower()

HEURISTICS = {_get_heuristic_name(heur): heur for heur in get_heuristics()}
print(HEURISTICS)

# Training settings
parser = argparse.ArgumentParser()
parser.add_argument('--no-cuda', action='store_true', default=False,
                    help='Disables CUDA training.')
parser.add_argument('--fastmode', action='store_true', default=False,
                    help='Validate during training pass.')
parser.add_argument('--seed', type=int, default=42, help='Random seed.')
parser.add_argument('--epochs', type=int, default=100,
                    help='Number of epochs to train.')
parser.add_argument('--lr', type=float, default=0.001,
                    help='Initial learning rate.')
parser.add_argument('--weight_decay', type=float, default=5e-4,
                    help='Weight decay (L2 loss on parameters).')
parser.add_argument('--hidden', type=int, default=60,
                    help='Number of hidden units.')
parser.add_argument('--dropout', type=float, default=0.5,
                    help='Dropout rate (1 - keep probability).')
parser.add_argument('--domain', type=str, default='blocks',
                    help='Domain to train the model')
parser.add_argument('--data_per_task', type=int, default=150,
                    help='Examples per task')
parser.add_argument('--discriminator', action='store_true', default=False,
                    help='Whether to use a discriminator for predictions')
parser.add_argument('--checkpoint', type=str, default='checkpoints/checkpoint.pth',
                    help='Save checkpoint path')
parser.add_argument('--expansion_level', type=int, default=3)

args = parser.parse_args()
args.cuda = not args.no_cuda and torch.cuda.is_available()

np.random.seed(args.seed)
torch.manual_seed(args.seed)
if args.cuda:
    torch.cuda.manual_seed(args.seed)

# Load data
train_loader, val_loader = create_loaders(args.domain, data_per_task=args.data_per_task,
                                          expansion_level=args.expansion_level)
# adj, features, labels, idx_train, idx_val, idx_test = load_data()
# print(adj.shape, features.shape, labels.shape)
# raise


if 'blocks' in args.domain:
    features = 81
# if args.domain == 'blocksworld_random_3':
#     features = 81
if args.domain == 'sokoban_random_5_1_0':
    features = 16704

# Model and optimizer
model = GCN(nfeat=features,
            nhid=args.hidden,
            nclass=1,
            dropout=args.dropout).cuda()
discrim = Discriminator(features=features, dropout=args.dropout).cuda()
optimizer = torch.optim.Adam(model.parameters(),
                             lr=args.lr, weight_decay=args.weight_decay)
optim_discrim = torch.optim.Adam(discrim.parameters(),
                             lr=args.lr, weight_decay=args.weight_decay)

task_loss = torch.nn.MSELoss()
adversarial_loss = torch.nn.BCELoss()

def train(epoch):
    t = time.time()
    model.train()
    total_loss = 0
    d_loss_total = 0
    g_loss_total = 0
    iterations = 0
    for (adj, features, goals, label) in train_loader:
        valid = torch.tensor([1.], requires_grad=False).cuda()
        fake = torch.tensor([0.], requires_grad=False).cuda()

        # print(data)
        adj = adj.squeeze(0).cuda()
        features = features.squeeze(0).cuda()
        goals = goals.squeeze(0).cuda()
        label = label.cuda()
        # print(adj.shape)
        # print(features.shape)
        # print(goals.shape)

        output = model(features, adj, goals)

        # print(adj.shape)
        # print(features.shape)
        # print(goals.shape)
        # print(label.shape)
        # print('output: ', output.shape)
        output = output.squeeze(1)
        output = output.unsqueeze(0)
        # print('output: ', output.shape)
        """
        Train Discriminator
        """
        if args.discriminator:
            real_loss = adversarial_loss(discrim(label), valid)
            fake_loss = adversarial_loss(discrim(output.detach()), fake)

            optim_discrim.zero_grad()
            d_loss = (real_loss + fake_loss)/2.
            d_loss_total += d_loss.item()
            d_loss.backward()
            optim_discrim.step()


            g_loss = adversarial_loss(discrim(output), valid)
            g_loss_total += g_loss.item()

        if iterations % 20 == 0:
            print('Output: ', output)
            print('Label : ', label)


        loss = task_loss(output, label)
        if args.discriminator:
            loss += g_loss
        # acc_train = accuracy(output[i, labels[idx_train])
        # print(loss_train)
        # print(output)
        # print(label)
        total_loss += loss.item()
        iterations += 1
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

    print('Train Loss: ', total_loss/float(iterations))
    print('D Loss    : ', d_loss_total/float(iterations))
    print('G Loss    : ', g_loss_total/float(iterations))
    total_loss = 0
    iterations = 0

    for (adj, features, goals, label) in val_loader:
        adj = adj.squeeze(0).cuda()
        features = features.squeeze(0).cuda()
        goals = goals.squeeze(0).cuda()
        label = label.cuda()
        # print(adj.shape)
        # print(features.shape)
        # print(goals.shape)

        output = model(features, adj, goals)
        output = output.squeeze(1)
        output = output.unsqueeze(0)

        loss = F.mse_loss(output, label)
        total_loss += loss.item()
        # total_loss = torch.sum(torch.abs(output - label))
        iterations += 1

    print('Val Loss: ', total_loss/float(iterations))
    torch.save(model.state_dict(), args.checkpoint)

    # if not args.fastmode:
    #     # Evaluate validation set performance separately,
    #     # deactivates dropout during validation run.
    #     model.eval()
    #     output = model(features, adj)

    # loss_val = F.nll_loss(output[idx_val], labels[idx_val])
    # acc_val = accuracy(output[idx_val], labels[idx_val])
    # print('Epoch: {:04d}'.format(epoch+1),
    #       'loss_train: {:.4f}'.format(loss_train.item()),
    #       'acc_train: {:.4f}'.format(acc_train.item()),
    #       'loss_val: {:.4f}'.format(loss_val.item()),
    #       'acc_val: {:.4f}'.format(acc_val.item()),
    #       'time: {:.4f}s'.format(time.time() - t))


if __name__ == '__main__':
    # Train model
    t_total = time.time()
    for epoch in range(args.epochs):
        train(epoch)
    print("Optimization Finished!")
    print("Total time elapsed: {:.4f}s".format(time.time() - t_total))

    # Testing
    test()
