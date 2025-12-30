#!/bin/bash

# Server 1: stapp01.stratos.xfusioncorp.com (user: tony)
ssh tony@stapp01.stratos.xfusioncorp.com << 'EOF'
  echo "Connected to Server 1"
  sudo su
  cat /etc/os-release
  yum install cronie -y || apt install cron -y
  systemctl start crond
  systemctl enable crond
  (crontab -l 2>/dev/null; echo "*/5 * * * * echo hello > /tmp/cron_text") | crontab -
  crontab -l
EOF

# Server 2: stapp02.stratos.xfusioncorp.com (user: steve)
ssh steve@stapp02.stratos.xfusioncorp.com << 'EOF'
  echo "Connected to Server 2"
  sudo su
  cat /etc/os-release
  yum install cronie -y || apt install cron -y
  systemctl start crond
  systemctl enable crond
  (crontab -l 2>/dev/null; echo "*/5 * * * * echo hello > /tmp/cron_text") | crontab -
  crontab -l
EOF

# Server 3: stapp03.stratos.xfusioncorp.com (user: banner)
ssh banner@stapp03.stratos.xfusioncorp.com << 'EOF'
  echo "Connected to Server 3"
  sudo su
  cat /etc/os-release
  yum install cronie -y || apt install cron -y
  systemctl start crond
  systemctl enable crond
  (crontab -l 2>/dev/null; echo "*/5 * * * * echo hello > /tmp/cron_text") | crontab -
  crontab -l
EOF