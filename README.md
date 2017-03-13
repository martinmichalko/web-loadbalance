### set of ansible playbooks deploys apache webservers with loadbalancer

following environment will be created all in CentOS 7

3 virtual machines  each with apache web server with simple web page Hello world <hostname>
- each web server is in the docker container
virtual machine with load balancer - haproxy and docker registry to deploy the images on nodes
- haproxy is configured with level 4 roundrobin loadbalancing

with this command the environment will be prepared:
```bash
ansible-playbook -i inventory all.yml
```
