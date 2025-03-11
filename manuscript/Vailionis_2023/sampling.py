from cobra.io import read_sbml_model
from cobra.sampling import sample
import argparse
import pandas as pd
#from functools import partial
#from pathos.multiprocessing import ProcessingPool as Pool
import os

parser = argparse.ArgumentParser(description="Flux sample from a model")
parser.add_argument("model", metavar="MODEL_PATH", help="path to sbml formatted model")
parser.add_argument("N", type=int, help="Number of samples to collect")
parser.add_argument("--delete", metavar="RXNID", help="comma separated list of reactions to delete")
parser.add_argument("--runs", metavar="X", type=int, default=10, help="Number of batches to split the sampling between, default 10")
parser.add_argument("--threads", metavar="X", type=int, default=1, help="Number of different threads to run the sampling runs across, default 1")
parser.add_argument("--output", metavar="PATH", default=os.path.join(os.getcwd(), "sampling.csv"), help="Output file path for the sampling results, default is 'sampling.csv' in the current directory")
#parser.add_argument("--constrain", action="append", nargs="+", 
args = parser.parse_args()

def multisample(model, n, runs=5, threads=1):
    n_per_run = int(n/runs)
    if n_per_run*runs != n:
        print("Note: specified number of samples is not divisible by number of runs")
    print("Collecting {r} samples of size {x}, for {y} total samples".format(r=runs, x=n_per_run, y=runs*n_per_run))
    #p = Pool(nodes=threads)
    #result = p.uimap(partial(sample, processes=1), (model,)*runs, (n_per_run,)*runs)
    #p.close()
    #p.join()
    #p.clear()
    result = []
    for i in range(runs):
        s = sample(model, n_per_run, processes=threads)
        result.append(s)
    return pd.concat(result, axis=0).reset_index()

with open(args.model, "r") as f:
	model = read_sbml_model(f)

model.solver = 'cplex'

if args.delete is not None:
	deletion_list = args.delete.split(",")
	model.remove_reactions(deletion_list)

s = multisample(model, args.N, runs=args.runs, threads=args.threads)
s.drop(columns=["index"]).to_csv(args.output, index=False)
