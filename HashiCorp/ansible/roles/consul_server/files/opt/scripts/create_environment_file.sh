#!/bin/bash

SCRIPT_NAME=$(basename $0)

# Clean up before start
rm /run/${SCRIPT_NAME}.* 2>/dev/null

# Create a new file on every run
ENVIRONMENT_FILE=/run/environment_vars
echo -n > $ENVIRONMENT_FILE

##
# Get intance ID
##
while true
do
    echo -n "[INFO]: Looking for instance ID ... "
    INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id 2>&1)
    if [[ $INSTANCE_ID =~ ^i-[0-9a-fA-F]+$ ]]
    then
        echo "'$INSTANCE_ID'"; break
    else
        echo "ERROR"
    fi
    sleep 1
done
echo "INSTANCE_ID=$INSTANCE_ID" >> $ENVIRONMENT_FILE

##
# Get private IP
##
while true
do
    echo -n "[INFO]: Looking for private IP address ... "
    PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4 2>&1)
    if [[ $PRIVATE_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
    then
        echo "'$PRIVATE_IP'"; break
    else
        echo "ERROR"
    fi
    sleep 1
done
echo "PRIVATE_IP=$PRIVATE_IP" >> $ENVIRONMENT_FILE

##
# Get AWS Default Region
##
while true
do
    echo -n "[INFO]: Looking for AWS Default Region ... "
    AWS_DEFAULT_REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document 2>&1 | grep region | sed "s/.*: \"\(.*\)\".*/\1/")
    if [[ $AWS_DEFAULT_REGION =~ ^.*-.*-.*$ ]]
    then
        echo "'$AWS_DEFAULT_REGION'"; break
    else
        echo "ERROR"
    fi
    sleep 1
done
echo "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" >> $ENVIRONMENT_FILE

##
# Get AWS Availability Zone
##
while true
do
    echo -n "[INFO]: Looking for AWS Availability Zone ... "
    AWS_AVAILABILITY_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone 2>&1)
    if [[ $AWS_AVAILABILITY_ZONE =~ ^.*-.*-.*$ ]]
    then
        echo "'$AWS_AVAILABILITY_ZONE'"; break
    else
        echo "ERROR"
    fi
    sleep 1
done
echo "AWS_AVAILABILITY_ZONE=$AWS_AVAILABILITY_ZONE" >> $ENVIRONMENT_FILE

# Mark successfully complete
touch /run/${SCRIPT_NAME}.done
