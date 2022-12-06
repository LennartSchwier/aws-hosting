#!/bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
echo Hello, World! > /var/www/html/index.html

