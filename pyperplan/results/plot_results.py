# Number of objects in blocksworld
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
sns.set()
sns.set_style("white")

files = [
    "standard_10epochs/blocksworld_random_3.txt",
    "standard_10epochs/blocksworld_random_4.txt",
    "standard_10epochs/blocksworld_random_5.txt"
]
f_ids = [3,4,5]

# 5.5 +- 2.91	23.23 +- 25.59	187.68 +- 204.92				10.13 +- 6.83	46.10 +- 36.55	285.67 +- 248.27
# gcn = [5.5, 23.23, 187.68]
# gcn_std = [2.91, 25.59, 204.92]
# blind = [10.13, 46.10, 285.67]
# blind_std = [6.83, 36.55, 248.27]
gcn = []
gcn_std = []
blind = []
blind_std = []
lmcut = []
lmcut_std = []
for f in files:
    with open(f) as fid:
        line = fid.readline().rstrip('\n')
        line = line.split()
        gcn.append(float(line[0]))
        gcn_std.append(float(line[1]))

        line = fid.readline().rstrip('\n')
        line = line.split()
        blind.append(float(line[0]))
        blind_std.append(float(line[1]))

        line = fid.readline().rstrip('\n')
        line = line.split()
        print(line)
        lmcut.append(float(line[0]))
        lmcut_std.append(float(line[1]))

width = 0.2
plt.bar([x-width for x in f_ids], lmcut, width=width, yerr=lmcut_std)
plt.bar([x for x in f_ids], gcn, width=width, yerr=gcn_std)
plt.bar([x+width for x in f_ids], blind, width=width, yerr=blind_std)
# plt.bar([3-0.3,4-0.1,5-0.1], gcn, width=0.2, yerr=gcn_std)
# plt.bar([3+0.1,4+0.1,5+0.1], blind, width=0.2, yerr=blind_std)

plt.rcParams.update({'font.size': 32})
plt.title('GCN vs Blind in Blocks World with GBFS', fontsize=20)
plt.legend(['Lmcut', 'GCN', 'Blind'], fontsize=20, loc='upper left')
plt.ylabel('Node Expansions', fontsize=20)
plt.xlabel('Number of Blocks', fontsize=20)
plt.xticks([3,4,5], fontsize=20)
plt.yticks([0, 100, 200, 300, 400, 500, 600], fontsize=20)
plt.ylim([0, 600])
plt.tight_layout()
plt.show()
plt.savefig('gcn_vs_blind_bgfs_blocksworld.pdf')


### NUMBER OF EPOCHS ###
files = [
    "standard_1epochs/blocksworld_random_3.txt",
    "standard_10epochs/blocksworld_random_3.txt",
    "standard_100epochs/blocksworld_random_3.txt",
]
gcn = []
gcn_std = []
blind = []
blind_std = []
lmcut = []
lmcut_std = []
for f in files:
    with open(f) as fid:
        line = fid.readline().rstrip('\n')
        line = line.split()
        gcn.append(float(line[0]))
        gcn_std.append(float(line[1]))

        line = fid.readline().rstrip('\n')
        line = line.split()
        blind.append(float(line[0]))
        blind_std.append(float(line[1]))

        line = fid.readline().rstrip('\n')
        line = line.split()
        print(line)
        lmcut.append(float(line[0]))
        lmcut_std.append(float(line[1]))

width = 0.2
plt.bar([x-width for x in f_ids], lmcut, width=width, yerr=lmcut_std)
plt.bar([x for x in f_ids], gcn, width=width, yerr=gcn_std)
plt.bar([x+width for x in f_ids], blind, width=width, yerr=blind_std)
# plt.bar([3-0.3,4-0.1,5-0.1], gcn, width=0.2, yerr=gcn_std)
# plt.bar([3+0.1,4+0.1,5+0.1], blind, width=0.2, yerr=blind_std)

plt.rcParams.update({'font.size': 32})
plt.title('GCN vs Blind in Blocks World with GBFS', fontsize=20)
plt.legend(['Lmcut', 'GCN', 'Blind'], fontsize=20, loc='upper left')
plt.ylabel('Node Expansions', fontsize=20)
plt.xlabel('Number of Epochs', fontsize=20)
plt.xticks([3,4,5], [1, 10, 100], fontsize=20)
plt.yticks([0, 10, 20], fontsize=20)
plt.ylim([0, 20])
plt.tight_layout()
plt.show()
# plt.savefig('gcn_number_of_epochs_bgfs_blocksworld.pdf')
