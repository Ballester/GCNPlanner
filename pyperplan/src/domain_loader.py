import torch
from torch.utils.data import Dataset
from imgaug import augmenters as iaa
import torchvision as tv
from torch.utils.data import DataLoader
from glob import glob

from pddl.parser import Parser as pddlParser
from search import breadth_first_search, searchspace
from search.a_star import astar_search_gcn
from heuristics.relaxation import hFFHeuristic
from domain_features import *

import numpy as np
import os
import grounding
import heuristics
import heapq
from collections import deque, defaultdict
import collections
from weakref import proxy
import random
random.seed(200)


def create_loaders(domain_name, data_per_task=20, expansion_level=3, test=False):
    print(domain_name)
    if not test:
        training_set = DomainDataset(domain_name, train=True, data_per_task=data_per_task)
        validation_set = DomainDataset(domain_name, validation=True, data_per_task=data_per_task)
        train_loader = DataLoader(training_set, shuffle=True, drop_last=True,
                                  num_workers=8, batch_size=1)
        validation_loader = DataLoader(validation_set, shuffle=False, drop_last=True,
                                       num_workers=8, batch_size=1)

        return train_loader, validation_loader

    else:
        test_set = DomainDataset(domain_name, test=True, data_per_task=data_per_task)
        test_loader = DataLoader(test_set, shuffle=False, drop_last=True,
                                 num_workers=8, batch_size=1)


def do_add(s, x):
  return len(s) != (s.add(x) or len(s))

class DomainDataset(object):
    def __init__(self, domain_name, train=False, validation=False, test=False,
                data_per_task=20, expansion_level=3):
        self.dataset = []
        path = os.path.join('../benchmarks', domain_name)

        domain_file = os.path.join(path, 'domain.pddl')
        pddl_parser = pddlParser(domain_file)
        domain = pddl_parser.parse_domain()

        tasks = glob(os.path.join(path, 'task*.pddl'))
        tasks = sorted(tasks)
        if train:
            tasks = tasks[0:int(0.2*len(tasks))]
        elif validation:
            tasks = tasks[int(0.2*len(tasks)):int(0.4*len(tasks))]
            # tasks = tasks[0:int(0.2*len(tasks))]
        elif test:
            tasks = tasks[int(0.4*len(tasks)):]

        print(tasks)
        for task in sorted(tasks):
            pddl_parser.set_prob_file(task)
            problem = pddl_parser.parse_problem(domain)
            task = grounding.ground(problem)
            heuristic = hFFHeuristic(task)
            print('Task: ', task.name)
            # print('Initial state: ', task.initial_state)
            # print(dir(task))
            # print(task.facts)

            # create several starting points for the task
            for i in range(0, data_per_task):
                if i == 0:
                    root = searchspace.make_root_node(task.initial_state)
                else:
                    if len(nodes) == 0:
                        break
                    root = searchspace.make_root_node(random.choice(list(nodes)))
                nodes = OrderedSet()
                solutions = []
                level = 0
                adjacency = defaultdict(list)
                queue = deque()
                queue.append((root, level))

                closed = {root}
                # print(root.state)
                solution = astar_search_gcn(task, root.state, heuristic)
                # print('Solution: ', solution)
                # print(len(solution))
                if solution is None:
                    print('No solution')
                    continue
                add = do_add(nodes, root.state)
                if add:
                    solutions.append(len(solution))
                while queue:
                    node, level = queue.popleft()
                    for operator, successor_state in task.get_successor_states(node.state):
                        node_child = searchspace.make_child_node(node, operator,
                                                                 successor_state)
                        adjacency[node.state].append(node_child.state)
                        if successor_state not in closed and level < expansion_level:
                            solution = astar_search_gcn(task, node_child.state, heuristic)
                            add = do_add(nodes, node_child.state)
                            if add:
                                if solution is None:
                                    solutions.append(100)
                                else:
                                    solutions.append(len(solution))

                            queue.append((node_child, level+1))
                            closed.add(successor_state)
                # build features and adjacency matrix and add to dataset
                adjacency_matrix = build_adjacency_matrix(nodes, adjacency)
                # if 'blocksworld' in domain.name:
                #     features = blocks_world_state(nodes)
                #     goal_features = blocks_world_state([task.goals])
                # if 'sokoban' in domain.name:
                #     features = sokoban_world_state(nodes)
                #     goal_features = sokoban_world_state([task.goals])
                features = generate_feature(domain.name, nodes)
                goal_features = generate_feature(domain.name, [task.goals])

                self.dataset.append((np.array(adjacency_matrix), features,
                                    np.array(goal_features), np.array(solutions)))


    def __getitem__(self, idx):
        #### each feature of a node is concatenated with the feature of the goal node ###
        adjacency_matrix, features, goal_features, label = self.dataset[idx]

        return (torch.FloatTensor(adjacency_matrix), torch.FloatTensor(features),
                torch.FloatTensor(goal_features), torch.FloatTensor(label))


    def __len__(self):
        return len(self.dataset)

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
