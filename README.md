# CyberSolutions-Accumulative
THE collection of my scripting, mapping, &amp; Playbooking. Linux, Windows, Mac


## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

CyberSolutions-Accumulative/Diagrams/Azure ELK-Server-NMAP.drawio.pdf
![image](https://user-images.githubusercontent.com/85303355/136429808-b7895947-a399-49c2-b8eb-a28d172a2c3a.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the [ELK-playbook.yml](https://github.com/Pitted8709/CyberSolutions-Accumulative/blob/14284f97e9ed5e1f16a5da5e4a2d5a168d185744/Ansible/ELK-playbook.yml) file may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly resilient, in addition to restricting traffic to the network.                       


- Load Balancers protect the availability of a server from DNS attacks or excessive traffic. By using a jump box, not only is the point of vulnerability obscured, but updates need only be targeted to one machine.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Log files & locations and services & system files.



The configuration details of each machine may be found below.


| Name     | Function | IP Address | Operating System |
|----------|:--------:|-----------:|------------------:|
| Jump Box | Gateway  | 10.0.10.4  | Linux             |
| Web1     |Web Server|10.0.10.7   |  Linux            |
| Web2     |Web Server| 10.0.10.8  |  Linux            |
| ELKbox   |ELK Server| 10.0.1.5   |  Linux            |



### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box   89.187.182.36 machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

Machines within the network can only be accessed by Jump Box 10.0.10.4 Ansible Container.


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|:-------------------:|---------------------:|
| Jump Box | Yes/No              | 89.187.182.36        |
| Web 1 & 2|     No              | 10.0.10.4  89.187.182.36|
|ELK Server|  No                 | 10.0.10.4  89.187.182.36|




### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automation ensures agentless access, single source updates, and no exploitables.


The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- Install Docker
- install Python3-pip
- Download image Docker w/ ELK container
- Copy config file
- List open ports
- Enable service on boot


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

Images/Docker ELK container active.JPG

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

- 10.0.10.7 Web Sever 2
- 10.0.10.8  Web Server 1


We have installed the following Beats on these machines:
- Metric Beats  
- Filebeat

These Beats allow us to collect the following information from each machine:

- Filebeat collects log files and sends them to elasticsearch. when a logfile or system file is created or changed, that user and action iformation is sent to elasticsearch.

- metricbeat collects and sends metric data to elasticsearch. when traffic is acting upon the servers, that data is collected in elasticsearch for visualization.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ELK-playbook.yml file to /etc/ansible.
- Update the /etc/ansible/ansible.cfg file to include the private IP of your ELK VM.
- Run the playbook, ansible-playbook  ELK-playbook.yml
- navigate to http://(your VM Public IP)/app/kibana#/home to check that the installation worked as expected.




