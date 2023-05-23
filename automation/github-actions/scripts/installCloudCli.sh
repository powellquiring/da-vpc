#! /bin/bash

# run the ibmcloud cli installer
curl -sL https://ibm.biz/idt-installer | bash

# run the ibmcloud cli and install needed plugins
ibmcloud plugin install catalogs-management
ibmcloud plugin install schematics

# list whats installed into the log
ibmcloud plugin list

# JLA - Where will IBMCLOUD_API_KEY come from? --> secrets.IBMCLOUD_API_KEY
# login to the IBM Cloud using an api key from the appropriate cloud account
ibmcloud login --apikey "$IBMCLOUD_API_KEY" --no-region