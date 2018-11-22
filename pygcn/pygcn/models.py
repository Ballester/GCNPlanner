import torch
import torch.nn as nn
import torch.nn.functional as F
from layers import GraphConvolution


class GCN(nn.Module):
    def __init__(self, nfeat, nhid, nclass, dropout):
        super(GCN, self).__init__()

        self.gc1 = GraphConvolution(nfeat, nhid)
        # self.gc_goal = GraphConvolution(nfeat, nhid)
        self.gc2 = GraphConvolution(nhid, nhid)
        self.gc3 = GraphConvolution(nhid, nhid)
        self.gc4 = GraphConvolution(nhid, nclass)
        self.dropout = dropout

    def forward(self, x, adj, goal):
        # goal = goal.expand(x.shape[0], goal.shape[1])
        # x = torch.cat([x, goal], dim=1)
        # zeros_col = torch.zeros(1, adj.shape[1]).cuda()
        # adj = torch.cat([adj, zeros_col], dim=0)
        #
        # zeros_row = torch.zeros(adj.shape[0], 1).cuda()
        # adj = torch.cat([adj, zeros_row], dim=1)
        x = (x + goal)/2.
        if len(adj.shape) == 1:
            adj = torch.unsqueeze(adj, 1)
        x = F.relu(self.gc1(x, adj))
        x = F.dropout(x, self.dropout, training=self.training)

        # # x = (x + goal)/2.
        # x = F.relu(self.gc2(x, adj))
        # x = F.dropout(x, self.dropout, training=self.training)
        #
        # # x = (x + goal)/2.
        # x = F.relu(self.gc3(x, adj))
        # x = F.dropout(x, self.dropout, training=self.training)

        # x = (x + goal)/2.
        x = F.relu(self.gc4(x, adj))

        return x
        # return F.log_softmax(x, dim=1)

class Discriminator(nn.Module):
    def __init__(self, features, dropout):
        super(Discriminator, self).__init__()
        self.features = features
        self.dropout = dropout

        self.conv1 = nn.Conv1d(1, 10, 3, stride=1, padding=1)
        # self.bn1 = nn.BatchNorm2d(10, 0.8)
        self.conv2 = nn.Conv1d(10, 10, 3, stride=1, padding=1)
        self.conv3 = nn.Conv1d(10, 1, 1, stride=1, padding=0)

        # self.model = nn.Sequential(
        #     *discriminator_block(1, 16, bn=False),
        #     *discriminator_block(16, 32),
        #     *discriminator_block(32, 64),
        #     # *discriminator_block(64, 128),
        # )

        # The height and width of downsampled image
        # ds_size = self.features
        # self.adv_layer = nn.Sequential( nn.Linear(64*ds_size**2, 1),
        #                                 nn.Sigmoid())

    def forward(self, x):
        x = x.unsqueeze(0)
        # print(x)
        # print(x.shape)
        x = self.conv1(x)
        x = F.leaky_relu(x)
        x = F.dropout(x, self.dropout, training=self.training)

        x = self.conv2(x)
        x = F.leaky_relu(x)
        x = F.dropout(x, self.dropout, training=self.training)

        x = self.conv3(x)
        x = x.squeeze()
        x = torch.mean(x)
        x = F.sigmoid(x)
        # print('Sigmoid: ', x)
        return x
        # x = self.bn1(x)
        # out = self.model(x)
        # out = out.view(out.shape[0], -1)
        # validity = self.adv_layer(out
        # return validity
