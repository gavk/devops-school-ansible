#!/usr/bin/env bash

for host in control node1 node2; do
  vagrant ssh ${host} -c 'sudo sed "{s|mirrorlist|#mirrorlist|;s|#baseurl=http://mirror.centos.org|baseurl=https://vault.centos.org|}" -i /etc/yum.repos.d/*'
done	
