#!/usr/bin/env bash

# Script install module firewalld for ansible
vagrant ssh control -c "sudo yum install -y ansible-collection-ansible-posix"
