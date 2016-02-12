# Terraform configuration for resources needed to get
# the wordpress application running.
resource "aws_security_group" "db_sg" {
        name = "db_sg"
        description = "MySQL RDS Security Group"
        vpc_id = "${aws_vpc.ECSVPC.id}"

        ingress {
                from_port = 3306
                to_port = 3306
                protocol = "tcp"
                security_groups = ["${aws_security_group.trust_sg.id}"]
        }

        egress {
                from_port = 3306
                to_port = 3306
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
        depends_on = ["aws_security_group.trust_sg"]
}

resource "aws_db_subnet_group" "default" {
        name = "private_group"
        description = "DB Group on Private Subnets"
        subnet_ids = ["${join(",", aws_subnet.private.*.id)}"]
        tags {
                Name = "DB Security Group"
        }
        depends_on = ["${join(",", aws_subnet.private.*.id)}"]
}

resource "aws_db_instance" "wordpress-db" {
        identifier = "mysql-rds"
        allocated_storage = 10
        engine = "mysql"
        engine_version = "5.6.23"
        instance_class = "db.t1.micro"
        name = "${database_name}"
        username = "${database_user}"
        password = "${database_password}"
        db_subnet_group_name = "${aws_db_subnet_group.default.name}"
        parameter_group_name = "default.mysql5.6"
        skip_final_snapshot = true
        publicly_accessible = false
}
