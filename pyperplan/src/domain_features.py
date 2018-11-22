import numpy as np

def generate_feature(domain_name, nodes):
    if 'blocks' in domain_name:
        return blocks_world_state(nodes)
    elif 'sokoban' in domain_name:
        return sokoban_world_state(nodes)
    raise Exception('No feature available for domain %s' % domain_name)

def blocks_world_state(nodes):
    features = []
    for node in nodes:
        feature = _blocks_world(node)
        features.append(feature)
    return np.array(features)

def _blocks_world(node):
    n_blocks = 8
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
    return feature

def sokoban_world_state(nodes):
    features = []
    for node in nodes:
        feature = _sokoban(node)
        features.append(feature)
    return np.array(features)

def _sokoban(node):
    n_blocks = 8
    n_blocks_sq = n_blocks**2
    n_boxes = 3
    n_walls = 3

    offset = {"at-robot": 0}
    total_offset = n_blocks_sq
    offset["at"] = total_offset
    total_offset += n_boxes*n_blocks_sq
    offset["adjacent"] = total_offset
    total_offset += n_blocks_sq*n_blocks_sq*4
    offset["clear"] = total_offset
    total_offset += n_blocks_sq

    feature = [0] * total_offset
    for fact in node:
        tup = fact.replace('(', '').replace(')', '').split()
        if tup[0] == "at-robot":
            x, y = split_block(tup[1])
            pos = x*n_blocks + y
            feature[pos] = 1
        if tup[0] == "at":
            box = int(tup[1][-1])
            x, y = split_block(tup[2])
            pos = box*n_blocks_sq + x*n_blocks + y
            feature[pos+offset["at"]] = 1
        if tup[0] == "adjacent":
            x1, y1 = split_block(tup[1])
            x2, y2 = split_block(tup[2])
            direction = dir_to_num(tup[3])
            pos = x1*n_blocks_sq*n_blocks_sq + y1*n_blocks_sq + x2*n_blocks + y2
            feature[pos+offset["adjacent"]] = 1
        if tup[0] == "clear":
            x1, y1 = split_block(tup[1])
            pos = x1*n_blocks + y1
            feature[pos+offset["clear"]] = 1

    return feature


### BLOCKS ###
def char_to_int(char):
    return int(char[1]) - 1

### SOKOBAN ###
def split_block(s):
    s = s.split('-')
    x = s[0][1]
    y = s[1][0]
    return int(x), int(y)

def dir_to_num(s):
    if s == "up":
        return 0
    if s == "right":
        return 1
    if s == "down":
        return 2
    if s == "left":
        return 3
