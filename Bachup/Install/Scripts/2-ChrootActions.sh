#!/bin/bash

# Ask the user to choose a password for the root and dev users
echo "Please choose a password for the root and dev users :"
read password

# Change the root password
echo root:$password | sudo chpasswd
# Create the dev user and set its password
useradd -m dev
echo dev:$password | sudo chpasswd
# add dev user to sudoers
echo "dev ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

