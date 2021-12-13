variable "ami_name" {
  type    = string
  default = "ami-0997f8647e96c0857"
}

variable "type" {
  type    = string
  default = "t3.medium"
}

variable "keyname" {
  type    = string
  default = "priv.pem"
}

data "aws_vpc" "my_vpc" {}

data "aws_subnet" "my-subnet" {
  filter {
    name   = "tag:Name"
    values = ["public_subnet"]
  }
}

data "aws_security_group" "my-sg" {
  filter {
    name   = "tag:Name"
    values = ["us-project-sg"]
  }
}


resource "aws_instance" "elk" {
  ami             = var.ami_name
  instance_type   = var.type
  key_name        = var.keyname
  security_groups = [data.aws_security_group.my-sg.id]
  subnet_id       = data.aws_subnet.my-subnet.id
  root_block_device {
    delete_on_termination = true
    volume_size           = 20
  }

  tags = {
    Name = "ELK"
  }
}

output "kibana_url" {
  value = join(":",[aws_instance.elk.public_ip,"5601"])
}
