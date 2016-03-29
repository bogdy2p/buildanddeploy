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
ApplyPhpPathInVendor="vendor/aoepeople/envsettingstool/apply.php";
InstallSHPathInVendor="vendor/aoepeople/magento-deployscripts/install.sh";

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

#################
#Copy install.sh 

InstallFrom1=$ApacheFolder/$BuildAndDeployFolder/patched-files/install.sh;
InstallTo1=$ApacheFolder/$AmoranaFolder/$ArtifactsFolder/build1/$InstallSHPathInVendor;
cp $InstallFrom1 $InstallTo1;
echo "Copied Install.sh";

#################
#Copy apply.php

ApplyPhpFrom1=$ApacheFolder/$BuildAndDeployFolder/patched-files/apply.php;
ApplyPhpTo1=$ApacheFolder/$AmoranaFolder/$ArtifactsFolder/build1/$ApplyPhpPathInVendor;
cp $ApplyPhpFrom1 $ApplyPhpTo1;
echo "Copied Apply.php (Overwritten)";



################
#Re-add to archives. (Maybe only first archive.)
echo "Re-added to archive;";
sleep(1);


################
#SSH To Live Server (Rsync?)
echo "SSH-ing with rsync to live server";
sleep(1);

################
#Run export command on live server (Via SSH)
echo "Running import via ssh on live server";
sleep(1);

echo "OK! ALL DONE !";