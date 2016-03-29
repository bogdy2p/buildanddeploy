#!/bin/bash

#Configurations
ApacheFolder="/var/www/html";
AmoranaFolder="amora_sec";
MagentoDeployScriptFolder="magento-deployscripts";
AmoranaGit="http://git.reea.net/reea/amorana.git";
MagentoDeployScriptsGit="https://github.com/AOEpeople/magento-deployscripts.git";

##############
#Cd into apache folder
cd $ApacheFolder;
ls;
##############
#Grab magento scripts into specific folder
git clone $MagentoDeployScriptsGit $MagentoDeployScriptFolder;

##############
#Grab amorana project into specific folder
git clone $AmoranaGit $AmoranaFolder;

##############
#Enter amorana folder
cd $AmoranaFolder;


##############
#Install amorana project with composer
composer install;

ls

export BUILD_NUMBER=1 && ../magento-deployscripts/build.sh -f build-${BUILD_NUMBER}.tar.gz -b ${BUILD_NUMBER}

echo "OK!";