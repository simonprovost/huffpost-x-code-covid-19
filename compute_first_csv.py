import csv
import pandas as pd
import sys, getopt

###### VARIABLES
### Here is the separator, you will be able to change it if the csv is in another separator format than ";".
separator=';'

###### COMPUTE
### Here we only check if there is no argument, if its the case so we will try to ask the user to put at lease one argument which will be the name of the output csv.
if len(sys.argv) < 1:
    print("need output file name as an argument.")
    sys.exit(0)
    
### Here we will read our CSV briefly previously talked about. With the name (see run.sh), the separator (can be handled via the variables part) and the engine do not care about that one.
print('read csv...')
usersDf = pd.read_csv('data_tests.csv', sep=separator, engine='python')

### Here we will trunc our dataframe to the 01 August.
## First of all we get the index on the dataframe where is the august 1.
## Secondly we will iloc, so trunc from this index and keep the rest including the index.
print('compute sexe...')
idx = usersDf.index[usersDf['semaine_glissante'] == '2020-07-26-2020-08-01'].tolist()
final = usersDf.iloc[idx[0]:]

### Here we will create our final csv with the path+name (arg 1 given to this script).
print('write output...')
final.to_csv(sys.argv[1], index = False, header=True)
print('done.')