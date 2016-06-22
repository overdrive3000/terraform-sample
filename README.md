# terraform-ecs-test
Deploy Wordpress application on AWS ECS using Terraform

## Variable file

To pass additional variables to terraform create a file with holds the variables, like:

```
# production.tfvars
aws_access_key = "XXXXXXXXXXX"
aws_secret_key = "YYYYYYYYYYYYYYYYYYYYYYYYYYY"
aws_key_path = "~/.ssh/id_rsa"
ssh_key_name = "terraform"
ssh_key = "ssh-rsa SALKDJASDFJ10`FU4QWOJEFLKSDJFLÑMSCDLMLKMSCÑLKQMDOQDLKFMLKSDC user@host"
database_password = "supersecureandlongpassword"
```

## Execute terraform

You can execute a plan first to know what Terraform will perform in the platform

```
terraform plan -var-file=production.tfvars
```

If everything is correct apply the changes

```
terraform apply -var-file=production.tfvars
```
