#!//bin/bash

# TRYING TO DEPLOY A SITE USING AUTOMATION

# STEPS


# Declare variables

packages="httpd wget unzip"
site="https://www.tooplate.com/zip-templates/2130_waso_strategy.zip"
artifact="2130_waso_strategy"
svc="httpd"
tmpdir="/tmp/webfiles"


# Install dependecies
echo "INSTALLING PACKAGES...................."
echo

yum install $packages -y > /dev/null
echo "PACKAGE INSTALL COMPLETED...................."
echo



# start httpd service
echo "STARTING AND ENABLING HTTPD SERVICE...................."
echo


systemctl start $svc
systemctl enable $svc
echo "COMPLETED SUCCESSSFULLY...................."
echo



# make /tmp/webfiles directory and enter into that directory

mkdir -p $tmpdir
cd $tmpdir


# download the relevant artifact
echo "DOWNLOADING ARTIFACT...................."
echo


wget $site > /dev/null
echo "COMPLETED DOWNLOAD...................."
echo

# unzip the artifact
echo "UNZIPPING ARTIFACT...................."
echo

unzip $artifact.zip > /dev/null
echo "COMPLETED SUCCESSFULLY...................."
echo


# transfer to /var/www/html/


cp -r $artifact/* /var/www/html/

# restart the service
echo "RESTARTING HTTPD SERVICE...................."
echo

systemctl restart $svc
echo "COMPLETED SUCCESSFULLY...................."
echo



# delete the temp dir
echo "CLEANUP...................."
echo

rm -rf $tmpdir
echo "COMPLETED...................."
echo

# show the ip address of the machine to test that it works
echo "SHOW IP ADDRESS...................."
echo
