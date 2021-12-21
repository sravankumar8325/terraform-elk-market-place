resource "aws_instance" "elk" {
  ami             = var.ami_name
  instance_type   = var.type
  key_name        = var.keyname
  security_groups = [var.my-sg]
  subnet_id       = var.my-subnet
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
