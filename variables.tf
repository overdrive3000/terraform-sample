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

variable "vpc_cidr" {
        description = "CIDR for the VPC"
        default = "10.130.0.0/16"
}

variable "public0_subnet_cidr" {
        description = "CIDR for Public Subnet 0"
        default = "10.130.0.0/24"
}

variable "public1_subnet_cidr" {
        description = "CIDR for Public Subnet 1"
        default = "10.130.1.0/24"
}

variable "private0_subnet_cidr" {
        description = "CIDR for Private Subnet 0"
        default = "10.130.2.0/24"
}

variable "private1_subnet_cidr" {
        description = "CIDR for Private Subnet 1"
        default = "10.130.3.0/24"
}
