ansible-playbook playbook_filebeat.yaml  -e env_name=server 

ansible-playbook playbook_logstash.yaml  -e env_name=server 

ansible-playbook playbook_logstash_docker.yaml  -e env_name=server 