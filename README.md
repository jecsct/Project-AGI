
# AGISIT Project Group 1

## Introduction

Our team has created a thought-sharing application that enables users to exchange and view diverse thoughts from all around the world. It also provides access to a repository of quotes through a dedicated service. The application securely stores all shared thoughts in a reliable and persistent MySQL database hosted on a dedicated server.

Demonstration video available at: https://youtu.be/vLheYQeKB8M

## Prerequisites

Running this project requires **VirtualBox** and **Vagrant**, along with the **vagrant-vbguest-plugin** plugin. These programs will run the local management virtual machine, which has the necessary tools for deploying the remote infrastructure (Terraform) and provisioning it (Ansible).

To host the application, a **Google Cloud (GCP) account** is mandatory for creating the dedicated project that houses the virtual machines required for the seamless operation of the application. Ensure that 'Compute Engine' is enabled.

## Application Design and Architecture

The **frontend** provides a homepage for users to exchange thoughts, a dedicated page for quotes, and a central hub page for shared thoughts.

On the **backend**, the microservices (built using Flask) are structured into distinct components, including a service responsible for delivering quotes, another for retrieving shared thoughts from the database, and a third service for securely storing thoughts in the database.

A **persistent MySQL database** operates independently to store the shared thoughts.

Both the frontend and backend microservices are equipped with custom load balancers that manage different replicas. To summarize, we have the following virtual machines:

- Load Balancer
- Web Servers (2 replicas)
- Quote Services (2 replicas)
- Get Thoughts Service (1 replica)
- Store Thought Service (1 replica)
- MySQL Database (1 replica)
- Monitor (Prometheus + Grafana)

For a visual representation, please refer to the following diagram.


## Application Deployment

To deploy the infrastructure, we need to edit the **terraform-gcp-provider** file to specify the path to the project API key (generated in the Google Cloud console). Additionally, update the **terraform-gcp-variables** file with the corresponding project ID.

Once the local virtual machine is running, use the `vagrant up` command to access it. Then, deploy the infrastructure using the commands below.

```
cd project/terraform
ssh-keygen -t rsa -b 4096
terraform init
terraform plan
terraform apply -auto-approve > outputs
cd ..
python3 extractor.py
cd ansible
ansible-playbook ansible-gcp-main-playbook.yml
```
Now, you can access the application using the Balancer IPv4 address, which balances our front-end servers and microservices. Additionally, access the Grafana web console using the Grafana IPv4 address on port 3000.


## Authors

João Salgueiro, nº 100740

João Travassos, nº 105710

Miguel Encarnação, nº  105718
