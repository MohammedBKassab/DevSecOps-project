
resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "./${var.key_name}.pem"
  file_permission = "0400"
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key.key_name
  subnet_id = var.subnet_id #we don't need to create a VPC , so we will use the default public Subnet
  vpc_security_group_ids = [aws_security_group.Netflix-SG.id]
  associate_public_ip_address = true
  tags = {
    Name = var.instance_name
  }
  root_block_device {
    volume_size = 30
    volume_type = "gp2"
    delete_on_termination = true
  }
  lifecycle {
    create_before_destroy = true
  }
}

 resource "aws_instance" "Monitoring-Server" {
  ami           = var.ami_id
  instance_type = "t2.medium"
  key_name      = aws_key_pair.ec2_key.key_name
  subnet_id = var.subnet_id #we don't need to create a VPC , so we will use the default public Subnet
  vpc_security_group_ids = [aws_security_group.Monitoring-SG.id]
  associate_public_ip_address = true
  root_block_device {
    volume_size = 25
    volume_type = "gp2"
    delete_on_termination = true
  }
  tags = {
    Name = "Monitoring-Server"
  }
  lifecycle {
    create_before_destroy = true
  }
   
 }


