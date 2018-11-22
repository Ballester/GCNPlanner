#
# This file is part of pyperplan.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#

from task import Operator, Task
from heuristics.heuristic_base import Heuristic

import sys
sys.path.append("/home/ballester/planning/pygcn")
sys.path.append("/home/ballester/planning/pygcn/pygcn")

import torch
import torch.nn.functional as F
import numpy as np
from pygcn.utils import load_data, accuracy
from pygcn.models import GCN
from domain_features import *

import collections
from collections import deque, defaultdict
from weakref import proxy
from search import searchspace


class GCNHeuristic(Heuristic):
    """
    Implements a gcn heuristic.
    It returns 0 if the goal was reached and 1 otherwise.
    """
    def __init__(self, task, domain_file, model_path):
        super(GCNHeuristic, self).__init__()
        self.domain_name = domain_file
        self.goals = task.goals
        self.max_level = 3
        self.task = task
        if "blocks" in self.domain_name:
            features = 81
        elif "sokoban" in self.domain_name:
            features = 16704
            
        hidden = 60
        dropout = 0.5

        self.model = GCN(nfeat=features,
                         nhid=hidden,
                         nclass=1,
                         dropout=dropout).cuda()
        # ckpt = torch.load('/home/ballester/planning/pyperplan/src/checkpoints/standard_sokoban.pth')
        ckpt = torch.load(model_path)
        self.model.load_state_dict(ckpt)
        self.model.eval()

        # print(self.goals)

    def __call__(self, node):
        # if all([(fact in node.state) for fact in self.goals]):
        #     return 0
        # else:
        #     return 1
        nodes = OrderedSet()
        solutions = []
        level = 0
        adjacency = defaultdict(list)
        queue = deque()
        queue.append((node, level))

        closed = {node}
        add = do_add(nodes, node.state)
        while queue:
            node, level = queue.popleft()
            for operator, successor_state in self.task.get_successor_states(node.state):
                node_child = searchspace.make_child_node(node, operator,
                                                         successor_state)
                adjacency[node.state].append(node_child.state)
                if successor_state not in closed and level < self.max_level:
                    add = do_add(nodes, node_child.state)

                    queue.append((node_child, level+1))
                    closed.add(successor_state)

        adjacency_matrix = build_adjacency_matrix(nodes, adjacency)
        # features = blocks_world_state(nodes)
        # goal_features = blocks_world_state([self.task.goals])
        features = generate_feature(self.domain_name, nodes)
        goal_features = generate_feature(self.domain_name, [self.task.goals])
        adj = torch.FloatTensor(adjacency_matrix)
        features = torch.FloatTensor(features)
        goals = torch.FloatTensor(goal_features)

        adj = adj.squeeze(0).cuda()
        features = features.squeeze(0).cuda()
        goals = goals.cuda()
        # print(adj.shape)
        # print(features.shape)
        # print(goals.shape)

        # print(adj.shape)
        # print(features.shape)
        # print(goals.shape)
        output = self.model(features, adj, goals)
        output = output.squeeze()
        output = output.unsqueeze(0)
        # print('Output: ', output)
        # print(output)
        # print(output[0][0])
        return output[0][0]


def blocks_world_state(nodes):
    features = []
    for node in nodes:
        feature = _blocks_world(node)
        features.append(feature)
    return np.array(features)

def _blocks_world(node):
    n_blocks = 5
    offset = {"on": 0}
    total_offset = n_blocks*(n_blocks-1)
    offset["on-table"] = total_offset
    total_offset += n_blocks
    offset["clear"] = total_offset
    total_offset += n_blocks
    offset["holding"] = total_offset
    total_offset += n_blocks
    offset["arm-empty"] = total_offset

    feature = [0] * (total_offset+1)
    for fact in node:
        tup = fact.replace('(', '').replace(')', '').split()
        if tup[0] == 'on':
            pos = char_to_int(tup[1])*n_blocks + char_to_int(tup[2])
            feature[pos] = 1
        elif len(tup) == 1:
            current_offset = offset[tup[0]]
            feature[current_offset] = 1
        elif len(tup) == 2:
            current_offset = offset[tup[0]]
            feature[current_offset + char_to_int(tup[1])] = 1
    # print('Len feature: ', len(feature))
    return feature

def char_to_int(char):
    return int(char[1]) - 1

def do_add(s, x):
  return len(s) != (s.add(x) or len(s))

def build_adjacency_matrix(nodes, adjacency_list):
    size = len(nodes)
    nodes = list(nodes)
    matrix = np.zeros((size, size))
    # print(adjacency_list)
    for key in adjacency_list.keys():
        if key in nodes:
            for neighbour in adjacency_list[key]:
                if neighbour in nodes:
                    matrix[nodes.index(key), nodes.index(neighbour)] = 1
    return matrix

class Link(object):
    __slots__ = 'prev', 'next', 'key', '__weakref__'

class OrderedSet(collections.MutableSet):
    'Set the remembers the order elements were added'
    # Big-O running times for all methods are the same as for regular sets.
    # The internal self.__map dictionary maps keys to links in a doubly linked list.
    # The circular doubly linked list starts and ends with a sentinel element.
    # The sentinel element never gets deleted (this simplifies the algorithm).
    # The prev/next links are weakref proxies (to prevent circular references).
    # Individual links are kept alive by the hard reference in self.__map.
    # Those hard references disappear when a key is deleted from an OrderedSet.

    def __init__(self, iterable=None):
        self.__root = root = Link()         # sentinel node for doubly linked list
        root.prev = root.next = root
        self.__map = {}                     # key --> link
        if iterable is not None:
            self |= iterable

    def __len__(self):
        return len(self.__map)

    def __contains__(self, key):
        return key in self.__map

    def add(self, key):
        # Store new key in a new link at the end of the linked list
        if key not in self.__map:
            self.__map[key] = link = Link()
            root = self.__root
            last = root.prev
            link.prev, link.next, link.key = last, root, key
            last.next = root.prev = proxy(link)

    def discard(self, key):
        # Remove an existing item using self.__map to find the link which is
        # then removed by updating the links in the predecessor and successors.
        if key in self.__map:
            link = self.__map.pop(key)
            link.prev.next = link.next
            link.next.prev = link.prev

    def __iter__(self):
        # Traverse the linked list in order.
        root = self.__root
        curr = root.next
        while curr is not root:
            yield curr.key
            curr = curr.next

    def __reversed__(self):
        # Traverse the linked list in reverse order.
        root = self.__root
        curr = root.prev
        while curr is not root:
            yield curr.key
            curr = curr.prev

    def pop(self, last=True):
        if not self:
            raise KeyError('set is empty')
        key = next(reversed(self)) if last else next(iter(self))
        self.discard(key)
        return key

    def __repr__(self):
        if not self:
            return '%s()' % (self.__class__.__name__,)
        return '%s(%r)' % (self.__class__.__name__, list(self))

    def __eq__(self, other):
        if isinstance(other, OrderedSet):
            return len(self) == len(other) and list(self) == list(other)
        return not self.isdisjoint(other)
