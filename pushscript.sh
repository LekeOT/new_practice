#!/bin/bash

# PUSH SCRIPTS TO VM TO AUTOMATE THE DEPLOYMENT PROCESS

# CREATE A VAR

USR="devops"



for MC in `cat vms`
do
        # we copy the document to the vm first
        echo "COPY DOCUMENT TO MACHINE............"
        scp multios.sh $USR@$MC:/tmp/

        # EXECUTE THE SCRIPT IN THE VMs
        ssh $USR@$MC sudo /tmp/multios.sh

        # remove the file to cleanup
        ssh $USR@$MC sudo rm -rf /tmp/multios.sh


done
