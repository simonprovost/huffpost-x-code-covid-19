import csv
import pandas as pd
import sys, getopt

###VARIABLES
separator=';'

###COMPUTE
if len(sys.argv) < 1:
    print("need output file name as an argument.")
    sys.exit(0)
    
print('read csv...')
usersDf = pd.read_csv('data_first_csv.csv', sep=separator, engine='python')

print('compute sexe...')
idx = usersDf.index[usersDf['semaine_glissante'] == '2020-07-26-2020-08-01'].tolist()
final = usersDf.iloc[idx[0]:]

print('write output...')
final.to_csv(sys.argv[1], index = False, header=True)
print('done.')
