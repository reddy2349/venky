#!/bin/bash
sudo yum -y update
sudo amazon-linux-extras -y install nginx1
sudo systemctl start nginx
sudo systemctl enable nginx
