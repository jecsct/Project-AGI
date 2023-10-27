import re

# Read the terraform outputs from the file
with open('terraform/outputs', 'r') as file:
    lines = file.readlines()
    last_lines = lines[-19:]
    terraform_output = ''.join(last_lines) 

# Extract IP addresses using regular expressions
ip_addresses = re.findall(r'[0-9]+(?:\.[0-9]+){3}', terraform_output)

# Mapping names to IP addresses
ip_mapping = {
    "balancer": ip_addresses[0],
    "database": ip_addresses[1],
    "get1": ip_addresses[2],
    "grafana": ip_addresses[3],
    "prometheus":ip_addresses[4],
    "quote1": ip_addresses[5],
    "quote2": ip_addresses[6],
    "send1": ip_addresses[7],
    "web1": ip_addresses[8],
    "web2": ip_addresses[9]
}

# Extract specific values in the required format
required_ips = {key: f"{key} = \"{value}\"" for key, value in ip_mapping.items() if key in ["send1", "get1", "database","balancer"]}
# Overwrite the file with the new lines
with open('application/config.py', 'w') as file:
    for line in required_ips.values():
        file.write(f"{line}" + "\n")

# Generating the hosts file content
hosts_file_content = ""
for key, value in ip_mapping.items():
    hosts_file_content += f"{key}\tansible_host={value} ansible_user=ubuntu ansible_connection=ssh\n"

# Appending the additional content
additional_content = """

[osmgmt]
localhost           ansible_connection=local

[web]
web1
web2

[database]
database

[loadbalancer]
balancer

[quote]
quote1
quote2

[send_thought]
send1

[get_thought]
get1

[prometheus]
prometheus

[grafana]
grafana

[monitor]
web1
web2
get1
send1
quote1

[targets]
balancer
database
web1
web2
get1
send1
quote1
prometheus
grafana
"""

with open('gcphosts', 'w') as file:
    file.write(hosts_file_content + additional_content)

print("Hosts file generated successfully.")
