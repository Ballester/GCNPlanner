import os
import io
import numpy as np
from glob import glob
from pyperplan import *
from domain_loader import create_loaders

# Commandline parsing
log_levels = ['debug', 'info', 'warning', 'error']

# get pretty print names for the search algorithms:
# use the function/class name and strip off '_search'
def get_callable_names(callables, omit_string):
    names = [c.__name__ for c in callables]
    names = [n.replace(omit_string, '').replace('_', ' ') for n in names]
    return ', '.join(names)
search_names = get_callable_names(SEARCHES.values(), '_search')

argparser = argparse.ArgumentParser(
                    formatter_class=argparse.ArgumentDefaultsHelpFormatter)
argparser.add_argument(dest='domain', nargs='?')
# argparser.add_argument(dest='problem')
argparser.add_argument('-l', '--loglevel', choices=log_levels,
                       default='info')
argparser.add_argument('-H', '--heuristic', choices=HEURISTICS.keys(),
                       help='Select a heuristic', default='hff')
argparser.add_argument('-s', '--search', choices=SEARCHES.keys(),
    help='Select a search algorithm from {0}'.format(search_names),
    default='bfs')
argparser.add_argument('-m', '--model', type=str,
                       help='Model path')
args = argparser.parse_args()

logging.basicConfig(level=getattr(logging, args.loglevel.upper()),
                format='%(asctime)s %(levelname)-8s %(message)s',
                stream=sys.stdout)
logger = logging.getLogger('basic_logger')
logger.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s %(levelname)-8s %(message)s')
log_capture_string = io.StringIO()
ch = logging.StreamHandler(log_capture_string)

ch.setFormatter(formatter)

### Add the console handler to the logger
logger.addHandler(ch)

hffpo_searches = ['gbf', 'wastar', 'ehs']
if args.heuristic == 'hffpo' and args.search not in hffpo_searches:
    print('ERROR: hffpo can currently only be used with %s\n' %
          hffpo_searches, file=sys.stderr)
    argparser.print_help()
    exit(2)

# args.problem = os.path.abspath(args.problem)
# if args.domain is None:
#     args.domain = find_domain(args.problem)
# else:
#     args.domain = os.path.abspath(args.domain)

search = SEARCHES[args.search]
heuristic = HEURISTICS[args.heuristic]

gcn_heuristic = HEURISTICS['gcn']
blind_heuristic = HEURISTICS['blind']
lmcut_heuristic = HEURISTICS['lmcut']
if args.search in ['bfs', 'ids', 'sat']:
    heuristic = None

logging.info('using search: %s' % search.__name__)
logging.info('using heuristic: %s' % (heuristic.__name__ if heuristic
                                      else None))
use_preferred_ops = (args.heuristic == 'hffpo')
path = os.path.join('benchmarks', args.domain)
print(args.domain)

domain_file = os.path.join(path, 'domain.pddl')
tasks = glob(os.path.join(path, 'task*.pddl'))
tasks = sorted(tasks)
tasks = tasks[int(0.4*len(tasks)):]

gcn_expansions = []
blind_expansions = []
lmcut_expansions = []
for task in tasks:
    print(task)
    # log_contents = log_capture_string.getvalue()
    # print(log_contents)

    solution, expansions = search_plan(domain_file, task, search, gcn_heuristic,
                                       use_preferred_ops=use_preferred_ops, model=args.model)
    gcn_expansions.append(expansions)

    solution, expansions = search_plan(domain_file, task, search, blind_heuristic,
                                       use_preferred_ops=use_preferred_ops)
    blind_expansions.append(expansions)

    # solution, expansions = search_plan(domain_file, task, search, lmcut_heuristic,
    #                                    use_preferred_ops=use_preferred_ops)
    # lmcut_expansions.append(expansions)

print(gcn_expansions)
print(blind_expansions)
# print(lmcut_expansions)
print(np.mean(gcn_expansions), np.std(gcn_expansions))
print(np.mean(blind_expansions), np.std(blind_expansions))
with open('results/' + args.domain + '.txt', 'w') as fid:
    gcn_result = "%.2f %.2f\n" % (np.mean(gcn_expansions), np.std(gcn_expansions))
    blind_result = "%.2f %.2f\n" % (np.mean(blind_expansions), np.std(blind_expansions))
    fid.write(gcn_result)
    fid.write(blind_result)
# print(np.mean(lmcut_expansions))
# if solution is None:
#     logging.warning('No solution could be found')
# else:
# solution_file = args.problem + '.soln'
# logging.info('Plan length: %s' % len(solution))
# _write_solution(solution, solution_file)
# validate_solution(args.domain, args.problem, solution_file)
