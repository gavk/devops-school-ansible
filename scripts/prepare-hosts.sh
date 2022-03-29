#!/usr/bin/env bash

USERNAME="ansible"
PASSWD="EBb2up1H8ayaUGr3A3ih"
NODES="node1 node2"
HOSTS="control ${NODES}"



for host in ${HOSTS}; do
    echo "Create user '${USERNAME}' with password '${PASSWD}' on host '${host}'."
    vagrant ssh ${host} -c "sudo useradd -m ${USERNAME}; echo ${PASSWD} | sudo passwd --stdin ${USERNAME}; echo '%ansible ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/ansible"
done

echo "Generate ssh-key on host 'control' for remote login without password to nodes '${NODES}'."
vagrant ssh control -c "echo | sudo -u ansible ssh-keygen -N ''"

echo "Copy ssh-keys from 'control' to '${NODES}'. Type: 'yes' + Enter, '${PASSWD}' + Enter."
for host in ${NODES}; do
    vagrant ssh control -c "sudo -u ansible ssh-copy-id ${host}"
done

vagrant ssh control -c "sudo yum install -y epel-release && sudo yum install -y ansible"
