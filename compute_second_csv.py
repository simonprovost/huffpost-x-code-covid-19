import csv
import pandas as pd
import sys, getopt

###VARIABLES
filterColumn=['dep','jour', 'hosp', 'rea', 'dc']
separator=';'

###COMPUTE
if len(sys.argv) < 1:
    print("need output file name as an argument.")
    sys.exit(0)
    
print('read csv...')
usersDf = pd.read_csv('data_second_csv.csv', sep=separator, engine='python')

print('compute sexe...')
new = usersDf.loc[usersDf['sexe'].isin(['0'])]

print('filtering columns...')
new = new.filter(filterColumn, axis=1)

print('write output...')
new.to_csv(sys.argv[1], index = False, header=True)
print('done.')
