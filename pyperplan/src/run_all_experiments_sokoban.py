import os
import sys

experiments = [
    # "sokoban_random_5_1_0",
    "sokoban_random_5_2_0",
    # "sokoban_random_6_1_0"
]
if len(sys.argv) != 2:
    raise Exception("Wrong usage: python3 src/run_all_experiments.py model_path")

for exp in experiments:
    os.system("python3 src/run_experiments_sokoban.py %s -s \
               gbf --model %s" % (exp, sys.argv[1]))
