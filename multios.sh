#!/bin/bash


# TRYING TO DEPLOY A SITE USING AUTOMATION

# STEPS


# Declare variables

#packages="httpd wget unzip"
site="https://www.tooplate.com/zip-templates/2130_waso_strategy.zip"
artifact="2130_waso_strategy"
#svc="httpd"
tmpdir="/tmp/webfiles"


yum --help &> /dev/null


if [ $? -eq 0 ]
then
        packages="httpd wget unzip"
        svc="httpd"



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

else
        packages="apache2 wget unzip"
        svc="apache2"

         # Install dependecies
        echo "INSTALLING PACKAGES...................."
        echo
        apt update
        apt install $packages -y > /dev/null
        echo "PACKAGE INSTALL COMPLETED...................."
        echo

        # start apache2 service
        echo "STARTING AND ENABLING APACHE2 SERVICE...................."
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
        echo "RESTARTING APACHE2 SERVICE...................."
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







fi

