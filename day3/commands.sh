#!/bin/bash

# Connect to Server 1
ssh tony@stapp01.stratos.xfusioncorp.com

# Gain root privileges on Server 1
sudo su

# Navigate to SSH config directory on Server 1
cd /etc/ssh

# Edit sshd_config on Server 1
sudo vi sshd_config

# Restart sshd service on Server 1
systemctl restart sshd

# Connect to Server 2
ssh steve@stapp02.stratos.xfusioncorp.com

# Gain root privileges on Server 2
sudo su

# Navigate to SSH config directory on Server 2
cd /etc/ssh

# Edit sshd_config on Server 2
sudo vi sshd_config

# Restart sshd service on Server 2
systemctl restart sshd

# Connect to Server 3
ssh banner@stapp03.stratos.xfusioncorp.com

# Gain root privileges on Server 3
sudo su

# Navigate to SSH config directory on Server 3
cd /etc/ssh

# Edit sshd_config on Server 3
sudo vi sshd_config

# Restart sshd service on Server 3
systemctl restart sshd