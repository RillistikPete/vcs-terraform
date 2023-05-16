terraform {
	backend "remote" {
		hostname = "app.terraform.io"
		organization = "kucas23"
		workspaces {
			name = "vcs-terraform"
		}
	}
}

provider "aws" {
     region = "us-east-1"
}

resource "aws_s3_bucket" "buckit" {
	bucket = "vcs-${uuid()}"
}

module "apache-Guy" {
	source  = "RillistikPete/moduleApache/aws"
	version = "1.0.0"
	vpc_id = var.vpc_id
	my_id_with_cidr = var.my_id_with_cidr
	public_key = var.public_key
	instance_type = var.instance_type
	server_name = var.server_name
}

output "public_ip" {
	value = module.apache-Guy.public_ip
}
