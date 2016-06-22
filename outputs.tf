#### VPC Outputs ####
output "public_subnets" {
        value = "${join(",", aws_subnet.public.*.id)}"
}

output "private_subnets" {
        value = "${join(",", aws_subnet.private.*.id)}"
}

output "nat_private_ip" {
        value = "${aws_nat_gateway.nat_gw.private_ip}"
}

output "nat_public_ip" {
        value = "${aws_nat_gateway.nat_gw.public_ip}"
}

### RDS Outputs ####
output "rds_endpoint" {
        value = "${aws_db_instance.wordpressdb.address}"
}

### ECS Outputs ###
output "ecs_name" {
        value = "${aws_ecs_cluster.wordpress-cluster.name}"
}

### ELB DNS ###
output "dns" {
  value = "{aws_elb.elb.dns_name}"
}
