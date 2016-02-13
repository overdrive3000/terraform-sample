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
                from_port = 0
                to_port = 0
                protocol = "-1"
                cidr_blocks = ["0.0.0.0/0"]
        }
        depends_on = ["aws_security_group.trust_sg"]
}

resource "aws_db_subnet_group" "default" {
        name = "private_group"
        description = "DB Group on Private Subnets"
        subnet_ids = ["${aws_subnet.private.0.id}", "${aws_subnet.private.1.id}"]
        tags {
                Name = "DB Security Group"
        }
        depends_on = ["aws_subnet.private"]
}

resource "aws_db_instance" "wordpressdb" {
        identifier = "wordpressrds"
        allocated_storage = 10
        engine = "mysql"
        engine_version = "5.6.23"
        instance_class = "db.t1.micro"
        name = "${var.database_name}"
        username = "${var.database_user}"
        password = "${var.database_password}"
        db_subnet_group_name = "${aws_db_subnet_group.default.name}"
        vpc_security_group_ids = ["${aws_security_group.db_sg.id}"]
        parameter_group_name = "default.mysql5.6"
        skip_final_snapshot = true
        publicly_accessible = false
}
