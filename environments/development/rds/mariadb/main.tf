terraform {
	backend "s3" {
    		bucket = "terraform-remote-configuration"
    		key    = "terraform/environments/development/rds/mariadb"
    		region = "us-east-2"
  	}
}

provider "aws" {		
	version						= "1.9"
	shared_credentials_file 		= "${var.aws_credentials_file}"
	region     					= "${var.aws_region}"
	profile    					= "${var.aws_credentials_profile}"	
}

module "mariadb" {
	vpc_name					= "Scipionyx Vpc"
	#
	source 					= "../../../modules/aws/rds/mariadb"
	#
	rds_database_name		= "infrastructure"
	rds_user					= "scipionyx"
	rds_password				= "soeusei11"
}
