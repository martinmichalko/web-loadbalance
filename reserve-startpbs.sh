#!/bin/bash
set -e
set -x
#build the environment
ansible-playbook -i backup/inventory /data/projects/ansible2-2/pb/virtuale/create-update-config.yml \
    --extra-vars "@backup/group_vars/all.yml" --extra-vars "@backup/group_vars/nodes.yml"

#prepare for apache
ansible-playbook -i backup/inventory \
    firewall-config.yml \
    packages-req.yml \
    docker.yml \
    docker-registry.yml \
    docker-apache2.yml \
    haproxy.yml \
    k8.yml --extra-vars "@backup/group_vars/all.yml" --extra-vars "@backup/group_vars/nodes.yml"
#create custom snapshot - fist should be all scripts finished and already
# after then the snapshot can be created
ansible-playbook -i backup/inventory /data/projects/ansible2-2/pb/virtuale/snapshot-create-custom.yml \
    --extra-vars "@backup/group_vars/all.yml" --extra-vars "@backup/group_vars/nodes.yml"
#we can continue
