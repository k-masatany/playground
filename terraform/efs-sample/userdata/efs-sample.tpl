#!/bin/bash

yum update -y
yum upgrade -y
yum install -y amazon-efs-utils

mkdir -p ${efs_directory}
echo "${file_system_id}:/ ${efs_directory} efs tls,_netdev" >> /etc/fstab
mount -a -t efs defaults
