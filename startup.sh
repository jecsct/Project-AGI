
#!/bin/bash

cd /home/vagrant/project/terraform
terraform apply -auto-approve > outputs
cd /home/vagrant/project/
python3 extractor.py
cd /home/vagrant/project/ansible
ansible-playbook ansible-gcp-main-playbook.yml