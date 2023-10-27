# agisit23-g1

## Name
AGISIT Project Group 1

## Description
Our team has created a thought-sharing application that enables users to exchange and see diverse thoughts all around the world, and access a repository of quotes provided by a created service. The application securely stores all shared thoughts in a reliable and persistent MySQL database, hosted on a dedicated server.

## Installation
This project's objective was to implement and provision an efficient infrastructure using the Infrastructure as Code (IaC) approach, where a microservices-based application will be running.
To run our project:
- Clone the front-end branch;
- Run $vagrant up to boot up the mgmt VM (Management Node);
- Establish an ssh session with mgmt using $vagrant ssh mgmt;
    - Go to project's terraform directory $cd project/terraform/
    - To deploy the servers to GCP, run the commands:
        - $terraform init;
        - $terraform plan;
        - $terraform apply -auto-approve > outputs
    - Next, go to project/ directory and run the IP extractor with $python3 extractor.py
    - The previous step will fill the file gcphosts used by ansible with the newly deployed VM IP's.
    - Go to project/ansible and run the main playbook with $ansible-playbook ansible-gcp-main-playbook.
    - Now, you can access the application with http://balancerIP which balances our front-end servers, or grafana web console with http://grafanaIP:3000.

## Authors 
João Salgueiro 100740
João Travassos 105710
Miguel Encarnação 105718