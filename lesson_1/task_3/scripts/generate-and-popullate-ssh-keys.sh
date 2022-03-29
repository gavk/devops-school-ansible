#!/usr/bin/env bash

echo | sudo -u ansible ssh-keygen -N ''
for host in node1 node2; do
    sudo -u ansible ssh-copy-id ${host}
done
