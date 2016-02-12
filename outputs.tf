#### VPC Outputs ####
output "public_subnets" {
        value = "${join("," aws_subnet.public.*.id)}"
}

output "private_subnets" {
        value = "${join("," aws_subnet.private.*.id)}"
}

output "nat_private_ip" {
        value = "${aws_nat_gateway.igw.private_ip}"
}

output "nat_public_ip" {
        value = "${aws_nat_gateway.igw.public_ip}"
}

### RDS Outputs ####
output "rds_endpoint" {
        value = "${aws_rds_instance.wordpress-db.address}"
}

output "rds_status" {
        value "${aws_rds_instance.wordpress-db.status}"
}
