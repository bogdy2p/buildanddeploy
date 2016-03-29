#!/bin/bash

LocalFolderFile="/var/www/html/amora_sec/artifacts/test.txt";
AwayFolderFile="artifacts/test.txt";
AwayAdress="amora_sec@second.amorana.ch";

rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress $LocalFolderFile $AwayAdress:$AwayFolderFile;

echo "Synced Succesfully";

