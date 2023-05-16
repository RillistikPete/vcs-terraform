terraform {

}

provider "aws" {
     region = "us-east-1"
}

module "apache-Guy" {
	source = ".//terraform-aws-apache-module"
	vpc_id = var.vpc_id
	my_id_with_cidr = var.my_id_with_cidr
	public_key = var.public_key
	instance_type = var.instance_type
	server_name = var.server_name
}

output "public_ip" {
	value = module.apache-Guy.public_ip
}
