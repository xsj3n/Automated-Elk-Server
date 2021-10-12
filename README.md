## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/xsj3n/Automated-Elk-Server/blob/master/Cloud-Diagram.png)


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting illicit access to the network.
- The load balancer acts as an intermediary between the internet and the web servers, delagating it's public IP to the web servers, uniting the two web servers under the same public address. Additionally, this connects the resource pools of the web servers. So, if one web server was to go down due to networking strains from denial-of-service attacks or any other reason, then the website found at public IP delagted by the load balancer would remain up as resources from the second web server would then expended as needed to keep the website up. 

- As the web servers are not facing the web themselves, secure access is done through a Jump-Box- a regular linux server which is accessible from the internet. It serves as a gateway into the DVWA machines that reside within the private network. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system metrics.

- The Filebeat configuration of included in the file utilzies the system module, which collects and parses logs created by the system logging service of common Unix based distributiotns.

- Metricbeat periodically collects metrics on the system such as CPU usage, memory, the file system, disk IO, and network IO statisitics. Additonally, statistics for every process running on the system.

The configuration details of each machine may be found below:

| Name     | Function             | Internal/Public IP     | Operating system |
|----------|----------------------|------------------------|------------------|
| Jump-Box | Gateway              | 10.0.0.4/20.80.176.167 | Ubuntu 18.4-TLS  |
| Elk-VM   | Log Analytic Monitor | 10.1.0.4/20.38.173.112 | Ubuntu 18.4-TLS  |
| Web-1    | Web Server           | 10.0.0.6/20.94.201.167 | Ubuntu 18.4-TLS  |
| Web-2    | Web Server           | 10.0.0.7/20.94.201.167 | Ubuntu 18.4-TLS  |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box and ELK-VM machine can accept connections from the Internet. Access to these machines are only allowed from the following IP addresses:
- 70.185.34.74

Machines within the network can only be accessed by through the Jump-Box, aside from the Elk machine which also is facing the internet.

- The Jump-Box in the machine which is used to delegate administration to the other machines on both subnets. 10.0.0.4 is the only address capable of connecting to the other machines.

A summary of the access policies in place can be found in the table below.

| Name     | Public Access | Whitelisted IPs |
|----------|---------------|-----------------|
| Jump-Box | Yes           | 70.185.34.74    |
| Elk-VM   | Yes           | 70.185.34.74    |
| Web-1    | No            | 10.0.0.6        |
| Web-2    | No            | 10.0.0.7        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because

The playbook implements the following tasks:
- Installs docker.io
- Installs pip3
- Installs Docker python module
- Sets the virtual memeory value 
- Downloads then launches a docker elk container
- Enables docker service on boot

The .yml elk playbook for installation can be found here.

- [install-elk.yml](https://github.com/xsj3n/Automated-Elk-Server/blob/master/resources/filebeat-playbook.yml)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

The configuration files for 

These Beats allow us to collect the following information from each machine:
- Both the Web-1 and Web-2 machine send system metric information such as CPU usages and things of the like with Metricbeat.
- Additonally, whatever system logs are produced on the web servers will be collected with the system Filebeat module.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

Note: Make sure to configure a hosts file for Ansible so the software knows which machines to execute playbooks on.

SSH into the control node and follow the steps below:
- Copy the playbooks into the control node
- Create a hosts file to instruct Ansible which machines to run the playbooks on.
- Run the playbooms with the command "ansible-playbook <name of playbook> <host group name>". For example: ansible-playbook install-elk.yml elk

Clarifications
- _Which file is the playbook? Where do I copy it?_
- There are 3 playbooks:
  - [Metricbeat-playbook.yml](https://github.com/xsj3n/Automated-Elk-Server/blob/master/resources/metricbeat-playbook.yml)
  - [Filebeat-playook.yml](https://github.com/xsj3n/Automated-Elk-Server/blob/master/resources/filebeat-playbook.yml)
  - [install-elk.yml](https://github.com/xsj3n/Automated-Elk-Server/blob/master/resources/filebeat-playbook.yml)
  - These should be copied to /etc/ansible/files/

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
 - /etc/ansible/hosts should apporiately group and point to target machines utilizng this format:
  
```
  
[webservers]
<IP of webserver>
<IP of webserver>

[elk]
<IP of ELK machine>
  
```

- _Which URL do you navigate to in order to check that the ELK server is running?
- Navigate to https://<IP of ELK  machine>:5601. 5601 is the default port in the configuration files.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
  
 Playbook Use: 
  - Use the following syntax to download the files: git clone <https://linktoproject.git>
  - Remove the files and clone them once again to update the files
  - The following syntax is used to run the playbooks: ansible <playbook-file> <target machine group>
  - Note: Make sure the source for the copy module in the Metricbeat and Filebeat playbooks is pointing to where the configuration files are at on your machine.
  
  
