# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ---------------------------------------------------------------------------------------------------------------------

#########################################################################
##Generate from here (https://console.aws.amazon.com/iam/home?#/security_credential)
##rootkey.csv
variable "ACCESS_KEY" {  default="xxxxxxxxxxx"  }
variable "SECRET_KEY" {  default="xxxxxxxxxxx"  }
variable "KEY_NAME" {  default="aws_key_new"  }
#########################################################################


#########################################################################
variable "REGION" {
  default = "us-east-1"
}
#########################################################################


#########################################################################
#Ubuntu Server 16.04 LTS (HVM), SSD Volume Type - ami-039a49e70ea773ffc (64-bit x86) / ami-0518d56c57a34cf51 (64-bit Arm)
#Ubuntu Server 16.04 LTS (HVM),EBS General Purpose (SSD) Volume Type. Support available from Canonical (http://www.ubuntu.com/cloud/services).
variable "AMAZON_MACHINE_IMAGE" {
  default = "ami-039a49e70ea773ffc"
}
#########################################################################


#########################################################################
# https://aws.amazon.com/ec2/instance-types/
# They have varying combinations of CPU, memory, storage, and networking capacity, and give you the flexibility to choose the appropriate mix of resources for your applications
# t2.micro is a free instance (General purpose)
# t2.micro (Variable ECUs, 1 vCPUs, 2.5 GHz, Intel Xeon Family, 1 GiB memory, EBS only)
variable "INSTANCE_TYPE" {
  default = "t2.micro"
}
#########################################################################


#########################################################################
variable "SERVER_PORT" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}
#########################################################################


#########################################################################
variable "SECURITY_GROUP_WEB" { default = "sg-061c8f004c4f053e3" }
variable "SECURITY_GROUP_TOMCAT" { default = "sg-c96e85b6" }
variable "SECURITY_GROUP_SSH" { default = "sg-057379cfb9aa3dd60" }
variable "SECURITY_GROUP_MYSQL" { default = "sg-9813e9e7" }
#########################################################################
