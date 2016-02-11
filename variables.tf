variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
        description = "EC2 Region to use"
        default = "us-east-1"
}

variable "ecs-ami" {
        type = "map"

        default = {
                us-east-1 = "ami-cb2305a1"
                us-west-1 = "ami-bdafdbdd"
                us-west-2 = "ami-ec75908c"
                eu-west-1 = "ami-13f84d60"
                eu-central-1 = "ami-c3253caf"
                ap-northeast-1 = "ami-e9724c87"
                ap-southeast-1 = "ami-5f31fd3c"
                ap-southeast-2 = "ami-83af8ae0"
        }
}

variable "availability_zones" {
        default = {
                "us-east-1" = "us-east-1b,us-east-1c"
                "us-west-1" = "us-west-1b,us-west-1c"
                "us-west-2" = "us-west-2a,us-west-2b"
                "eu-west-1" = "eu-west-1a,eu-west-1b"
                "eu-central-1" = "eu-central-1a,eu-central-1b"
                "ap-northeast-1" = "ap-northeast-1a,ap-northeast-1c"
                "ap-southeast-1" = "ap-southeast-1a,ap-southeast-1b"
                "ap-southeast-2" = "ap-southeast-2a,ap-southeast-2b"
        }
}

variable "vpc_cidr" {
        description = "CIDR for the VPC"
        default = "10.130.0.0/16"
}

variable "public_subnet_cidr" {
        default = { 
                "0" = "10.130.0.0/24"
                "1" = "10.130.1.0/24"
        }
}

variable "private_subnet_cidr" {
        default = { 
                "0" = "10.130.2.0/24"
                "1" = "10.130.3.0/24"
        }
}
