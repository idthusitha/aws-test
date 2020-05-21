# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A SINGLE EC2 INSTANCE
# This template uses runs a simple "Hello, World" web server on a single EC2 Instance
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region     = "${var.REGION}"
  access_key = "${var.ACCESS_KEY}"
  secret_key = "${var.SECRET_KEY}"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A SINGLE EC2 INSTANCE
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "web-server" {  
  ami 						= "${var.AMAZON_MACHINE_IMAGE}"
  instance_type 			= "${var.INSTANCE_TYPE}"  
  key_name 					= "${var.key_name}"
  vpc_security_group_ids 	= ["${var.SECURITY_GROUP_SSH}","${var.SECURITY_GROUP_WEB}"]
  root_block_device 		{
    		volume_size     = "8"
    		volume_type     = "gp2"
  }  
  tags          = {
    Name        = "terraform-web-server"
    Environment = "staging"
  }  
}
