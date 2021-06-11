#!/bin/bash




echo ------------------------------------------------------------------------------------------------
echo ----------------------          -----------------------------------             ---------------
echo --------------------            ----------------------------------              ---------------
echo --------------------            ----------------------------------              --------------
echo --------------------            ----------------------------------              --------------
echo --------------------             "CNMPRFX's WEB APP RECON SCRIPT"                -------------

sleep 5

echo "What domain would you like to run this on?"

read vardomain

echo "please write 2 different filenames and a directory name where the final output will be located."

echo "file 1"
read varfile1

echo "file 2"
read varfile2

echo "directory"
read vardir

mkdir $vardir


echo "     t                 tttttt              EEEEEE"
echo "i ttttttt ssssss         t       MM   MM   E"
echo "i    t    s              t    i  M M M M   EEEEE"
echo "i    t    ssssss         t    i  M  M  M   E"
echo "i    t         s         t    i  M     M   EEEEEE"
echo "          ssssss"    

sleep 5

echo "Running sublist3r now........"

sleep 2


sublist3r -d $vardomain >> $varfile1

echo "done"

sleep 1

echo "time to find some assets!!!"

sleep 2

echo "running assetfinder now..."

sleep 3

assetfinder $vardomain >> $varfile1

echo "done"

sleep 1

echo "now to amass some more results!!!"

sleep 2

echo "Running OWASP Amass now..."

amass enum  -passive -d $vardomain >> $varfile1

echo "done"

sleep 1

echo "now lets find out which one of these bad boys is alive...!"

sleep 2

cat $varfile1 | httprobe >> $varfile2

echo "done"

sleep 1

echo "Now lets see what these suckers look like!!!"

sleep 2

echo "Running GoWitness..."

gowitness file -s $varfile2 -t 40 -d $vardir

echo "done"

sleep 2

echo "Removing unnecessery files"

sleep 1

rm $varfile1 && rm $varfile2 

echo "Now lets check out what we have!!!"

sleep 1

echo "Starting http server on localhost port 8000"  

sleep 2

python3 -m http.server


