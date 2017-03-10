#!/bin/bash
set -e
set -x
#build the environment
#ansible-playbook -i inventory /data/projects/ansible2-2/pb/virtuale/create-update-config.yml --extra-vars "@group_vars/all.yml"

ansible-playbook -i inventory all.yml
#create custom snapshot - fist should be all scripts finished and already
# after then the snapshot can be created
#ansible-playbook -i inventory /data/projects/ansible2-2/pb/virtuale/snapshot-create-custom.yml --extra-vars "@group_vars/all.yml"
#we can continue
