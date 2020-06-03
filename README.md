# AWS - Ansible - Terraform for CICD

### Prerequisites:
   * AWS Account
   * git
   * Java 1.8
   * Gradle 5.0  
   * ansible 2.9.9
   * Terraform v0.12.24


### Ansible Installation for Ubuntu 18.04  [Click here](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04)
Ansible works by configuring client machines from a computer that has the Ansible components installed and configured.

It communicates over normal SSH channels to retrieve information from remote machines, issue commands, and copy files. Because of this, an Ansible system does not require any additional software to be installed on the client computers.
	
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt update
	sudo apt install ansible
	ansible --version
	sudo apt install python
		
	
### Terraform Installation for Ubuntu 18.04  [Click here](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-18-04)	
Terraform must first be installed on your machine. Terraform is distributed as a binary package for all supported platforms and architectures. This page will not cover how to compile Terraform from source, but compiling from source is covered in the documentation for those who want to be sure they're compiling source they trust into the final binary.

	wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
	unzip terraform_0.12.24_linux_amd64.zip
	sudo mv terraform /usr/bin
	//sudo mv terraform /usr/local/bin/
	terraform --version


## Repository Setup Installations (Terraform)


Change the following file for connect to AWS using terraform
	
	{{ WORKSPACE }}/aws-test/terraform/web-server/variables.tf	
	variable "access_key" {  default="XXXXXXXXXXXXXXXXXXXXXXXXXXXX"  }
	variable "secret_key" {  default="XXXXXXXXXXXXXXXXXXXXXXXXXXXX"  }


Creating instance in AWS Cloud
### Create access_key and secret_key from AWS Account


## Usage	

	cd {{ WORKSPACE }}/aws-test/terraform/	
	terraform init	
	terraform plan	
	terraform apply	
	terraform destroy
	
	ssh -i ~/.ssh/thusitha_aws.pem ubuntu@ec2-18-212-51-166.compute-1.amazonaws.com


## Repository Setup Installations (Ansible)

### Create aws_access_key_id and aws_secret_access_key from AWS Account

Please change the  following properties in ec2.ini
	
	{{ WORKSPACE }}aws-test/ansible/inventory/ec2.ini
	aws_access_key_id = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXXXXXX
	
Please change the  following properties in hosts. Get the IP from terraform output or AWS Console
	
	{{ WORKSPACE }}/aws-test/ansible/inventory/hosts
	[webservers]
	100.26.60.20

Please change the following properties in ansible.cfg for configuring pem key
		
	{{ WORKSPACE }}/aws-test/ansible/ansible.cfg
	private_key_file = /home/thusitha/.ssh/thusitha_aws.pem

## Usage

	cd {{ WORKSPACE }}/aws-deploy/ansible/
	#ssh-keygen -R 172.16.16.152
	#ssh-copy-id rezuser@172.16.16.152
	#ssh rezuser@172.16.16.152	
	ansible all -m ping	
	ansible-playbook playbook-tomcat-server.yml --ask-pass
	ansible-playbook playbook-tomcat-server.yml --ask-become-pass


### AWS use-full link

[create-and-activate-aws-account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)

[id_credentials_access-keys](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)

[ec2-key-pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)



## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.