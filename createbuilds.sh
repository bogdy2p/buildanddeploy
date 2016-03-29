#!/bin/bash

#Configurations
Clearer="###########################################################################################";
ApacheFolder="/var/www/html";
AmoranaFolder="amora_sec";
MagentoDeployScriptFolder="magento-deployscripts";
AmoranaGit="http://git.reea.net/reea/amorana.git";
MagentoDeployScriptsGit="https://github.com/AOEpeople/magento-deployscripts.git";

##############
#Cd into apache folder
cd $ApacheFolder;
ls;
echo $Clearer;
##############
#Grab magento scripts into specific folder
git clone $MagentoDeployScriptsGit $MagentoDeployScriptFolder;
echo $Clearer;
##############
#Grab amorana project into specific folder
git clone $AmoranaGit $AmoranaFolder;
echo $Clearer;
##############
#Enter amorana folder
cd $AmoranaFolder;
echo $Clearer;

##############
#Install amorana project with composer
composer install;
echo $Clearer;
ls
echo $Clearer;
export BUILD_NUMBER=1 && ../magento-deployscripts/build.sh -f build-${BUILD_NUMBER}.tar.gz -b ${BUILD_NUMBER}
echo $Clearer;
echo $Clearer;
echo $Clearer;
echo "OK!";