#!/bin/bash


############################################# SCRIPT 1 #############################################
####VARIABLES SCRIPT 1
URL="https://www.data.gouv.fr/fr/datasets/r/3c18e242-7d45-44f2-ac70-dee78a38ee1c"
COMPLETEMESSAGE="download COVID-19 France - complete - Huff."

####COMPUTE
## DESCR: Here we will download the csv give by the URL above. To download a file we use wget.
## TO conclude this part we print a message just to be sure that the download is done (during debugging).
## FEEL FREE: To play with the variables above, don't remove them.
## See man wget, wait and echo for more details about these commands.
wait;
/usr/bin/wget $URL &
wait;
echo $COMPLETEMESSAGE &

## Here we will change the name of the file received by a filename more human readable.
## And second line we will run the python script and give to him the first arg ($1), the first arg is given when we call this script (run.sh). It will be the name of the csv generated by this first script.
## See man mv and python3 {Script} execution (on google) for more details about these commands.
mv 3c18e242-7d45-44f2-ac70-dee78a38ee1c data_tests.csv
python3 /home/ubuntu/huffpost-x-code-covid-19/compute_first_csv.py $1
####################################################################################################


############################################# SCRIPT 2 #############################################
####VARIABLES SCRIPT 2
URL="https://static.data.gouv.fr/resources/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19/20201011-190018/donnees-hospitalieres-covid19-2020-10-11-19h00.csv"
COMPLETEMESSAGE="download COVID-19 France - complete - Huff."

####COMPUTE
## DESCR: Here we will download the csv give by the URL above. To download a file we use wget.
## TO conclude this part we print a message just to be sure that the download is done (during debugging).
## FEEL FREE: To play with the variables above, don't remove them.
## See man wget, wait and echo for more details about these commands.
wait;
/usr/bin/wget $URL &
wait;
echo $COMPLETEMESSAGE &

## Here we will change the name of the file received by a filename more human readable.
## And second line we will run the python script and give to him the second arg ($2), the second arg is given when we call this script (run.sh). It will be the name of the csv generated by this second script.
## See man mv and python3 {Script} execution (on google) for more details about these commands.
mv donnees-hospitalieres-covid19-2020-10-11-19h00.csv data_hosp.csv &&
python3 /home/ubuntu/huffpost-x-code-covid-19/compute_second_csv.py $2 &&

## Here we ask to remove some csv in order to minimize the size of this repository.
## See man rm for more details about this command.
rm data_hosp.csv data_tests.csv

## Here we will move the csv generated by our scripts to the /var/www/html which is the folder which contain all the files accessible by the outside of this VPS.
## See man mv for more details about this command.
sudo mv /home/ubuntu/huffpost-x-code-covid-19/hosp.csv /var/www/html
sudo mv /home/ubuntu/huffpost-x-code-covid-19/tests.csv /var/www/html
####################################################################################################
