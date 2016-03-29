#!/bin/bash

# #Configurations
# Clearer="###########################################################################################";
ApacheFolder="/var/www/html";
BuildAndDeployGit="https://github.com/bogdy2p/buildanddeploy.git";
BuildAndDeployFolder="buildanddeploy";
AmoranaFolder="amora_sec";
MagentoDeployScriptFolder="magento-deployscripts";
AmoranaGit="http://git.reea.net/reea/amorana.git";
MagentoDeployScriptsGit="https://github.com/AOEpeople/magento-deployscripts.git";
ArtifactsFolder="artifacts";

# ##############
#Cd into apache folder
cd $ApacheFolder;
ls;
echo $Clearer;

# ##############
#Grab current git folder for patched files.
git clone $BuildAndDeployGit $BuildAndDeployFolder
echo $Clearer;

# ##############
#Grab magento scripts into specific folder
git clone $MagentoDeployScriptsGit $MagentoDeployScriptFolder;
echo $Clearer;
# ##############
#Grab amorana project into specific folder
git clone $AmoranaGit $AmoranaFolder;
echo $Clearer;
# ##############
#Enter amorana folder
cd $AmoranaFolder;
echo $Clearer;

# ##############
#Install amorana project with composer
composer install;
echo $Clearer;
ls
echo $Clearer;
export BUILD_NUMBER=1 && ../magento-deployscripts/build.sh -f build-${BUILD_NUMBER}.tar.gz -b ${BUILD_NUMBER}
echo $Clearer;

cd $ArtifactsFolder;

echo $Clearer;

mkdir build1;
tar -xvzf build-1.tar.gz -C build1
echo $Clearer;
mkdir build1extra;
tar -xvzf build-1.extra.tar.gz -C build1extra
echo $Clearer;
ls

From1=$ApacheFolder/$BuildAndDeployFolder/patched-files/install.sh;
TO1=$ApacheFolder/testinstall.sh;
echo $Clearer;
echo $FROM1;
echo $Clearer;
echo $TO1;
cp $FROM1 $TO1;
# echo $From1;

echo "OK!";