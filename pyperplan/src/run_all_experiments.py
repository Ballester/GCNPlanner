import os
import sys

experiments = [
    "blocksworld_random_3",
    "blocksworld_random_4",
    "blocksworld_random_5"
    # "blocksworld_random_6",
    # "blocksworld_random_7",
    # "blocksworld_random_8"
]
if len(sys.argv) != 2:
    raise Exception("Wrong usage: python3 src/run_all_experiments.py model_path")

for exp in experiments:
    os.system("python3 src/run_experiments.py %s -s \
               gbf --model %s" % (exp, sys.argv[1]))
