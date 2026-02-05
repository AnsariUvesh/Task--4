resource "aws_instance" "strapi_ec2" {
  ami                    = "ami-0f58b397bc5c1f2e8"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name

  user_data = file("user_data.sh")

  tags = {
    Name = "strapi-ec2-${var.environment}"
  }
}
