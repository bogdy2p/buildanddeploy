#!/bin/bash

#Configurations
AmoranaFolder="amora_sec";
MagentoDeployScriptFolder="magento_deployscripts";
AmoranaGit="http://git.reea.net/reea/amorana.git";
MagentoDeployScriptsGit="https://github.com/AOEpeople/magento-deployscripts.git";


##############
#Cd into apache folder
cd /var/www/html;
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



echo "OK!";