#!/bin/bash

# Update the system
echo "[TASK 1] Updating the system"
yum update -y >/dev/null 2>&1

# Install desired packages
echo "[TASK 2] Installing desired packages"
yum install -y -q vim redhat-lsb-core net-tools bind-utils >/dev/null 2>&1

# Set up global aliases and exports
echo "[TASK 3] Creating global aliases and functions"
cat >>/etc/bashrc <<EOF
# Generated by Vagrant
alias vi='vim'
alias sudo='sudo '
export EDITOR=vim
export TERM=xterm
# Generated by Vagrant
EOF

echo "colorscheme elflord" >> /etc/vimrc

# Enable password authentication
echo "[TASK 4] Enabling password authentication in sshd config"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Disable SELinux
echo "[TASK 5] Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Set Root password
echo "[TASK 6] Set root password"
echo "admin" | passwd --stdin root >/dev/null 2>&1

# Disable and stop firewalld
echo "[TASK 5] Disable and stop firewalld"
systemctl disable firewalld >/dev/null 2>&1
systemctl stop firewalld

# Update hosts file
echo "[TASK 6] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.50.22 elkserver.eduami.org elkserver
192.168.50.23 sbclient.eduami.org sbclient
EOF

# install docker
# SET UP THE REPOSITORY
echo "[TASK 7] Install docker"
yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker

# install git
echo "[TASK 8] Install git"
yum install -y git

# htop utility
echo "[TASK 9] Install htop"
yum install -y epel-release
yum install -y htop

# install docker compose
echo "[TASK 10] Install docker compose"
yum install -y docker-compose