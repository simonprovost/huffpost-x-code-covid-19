###### IMPORT
### Here we import all librarys we will use to run properly this script.
import csv
import pandas as pd
import sys, getopt

###### VARIABLES
### Here we have two different variables that you will be able to modify anytime you want.
### {filterColumn}: Will define which column should be kept for the output csv.
### {separator}: Is the separator format of your csv.
filterColumn=['dep','jour', 'hosp', 'rea', 'dc']
separator=';'

###### COMPUTE
### Here we only check if there is no argument, if its the case so we will try to ask the user to put at lease one argument which will be the name of the output csv.
if len(sys.argv) < 1:
    print("need output file name as an argument.")
    sys.exit(0)
    
### Here we will read our CSV briefly previously talked about. With the name (see run.sh), the separator (can be handled via the variables part) and the engine do not care about that one.
print('read csv...')
usersDf = pd.read_csv('data_hosp.csv', sep=separator, engine='python')

idx = usersDf.index[usersDf['jour'] == '2020-08-01'].tolist()
new = usersDf.iloc[idx[0]:]

### Here we will create a new dataframe from the previous one but we will only accept rows where the column "sexe" is value is "0".
print('compute sexe...')
new = new.loc[new['sexe'].isin(['0'])]

### here we will filter, so more precisely we will drop some column to extract one of them. Refer you to the variable part.
## Do not care about axis=1.
print('filtering columns...')
final = new.filter(filterColumn, axis=1)

### Here we will create our final csv with the path+name (arg 1 given to this script).
print('write output...')
final.to_csv(sys.argv[1], index = False, header=True)
print('done.')
