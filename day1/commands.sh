#!/bin/bash

# Connect to Server 2 via SSH
ssh steve@stapp02.stratos.xfusioncorp.com

# Gain root privileges
sudo su

# Check if user 'mark' exists
id mark

# Add user 'mark' with home directory and no login shell
adduser mark -m -s /sbin/nologin

# Verify user 'mark' was added
id mark