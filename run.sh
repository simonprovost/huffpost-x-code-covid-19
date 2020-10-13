#!/bin/bash

####VARIABLES
URL="https://www.data.gouv.fr/fr/datasets/r/3c18e242-7d45-44f2-ac70-dee78a38ee1c"
COMPLETEMESSAGE="download COVID-19 France - complete - Huff."

####COMPUTE
wait;
which wget
/usr/bin/wget $URL &
wait;
echo $COMPLETEMESSAGE &

mv 3c18e242-7d45-44f2-ac70-dee78a38ee1c data_first_csv.csv
python3 /home/ubuntu/huffpost-x-code-covid-19/compute_first_csv.py $1

####VARIABLES
URL="https://static.data.gouv.fr/resources/donnees-hospitalieres-relatives-a-lepidemie-de-covid-19/20201011-190018/donnees-hospitalieres-covid19-2020-10-11-19h00.csv"
COMPLETEMESSAGE="download COVID-19 France - complete - Huff."

####COMPUTE
wait;
which wget
/usr/bin/wget $URL &
wait;
echo $COMPLETEMESSAGE &

mv donnees-hospitalieres-covid19-2020-10-11-19h00.csv data_second_csv.csv &&
python3 /home/ubuntu/huffpost-x-code-covid-19/compute_second_csv.py $2 &&
rm donnees-hospitalieres-covid19-2020-10-11-19h00* data_second_csv.csv data_first_csv.csv

sudo mv /home/ubuntu/huffpost-x-code-covid-19/first.csv /var/www/html
sudo mv /home/ubuntu/huffpost-x-code-covid-19/second.csv /var/www/html
