resource "aws_security_group" "allow_ssh" {

  vpc_id      = aws_vpc.main.id
  name        = "allow_ssh"
  description = "security group that allows ssh and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_security_group_rule" "ingress_rules"{
    count = length(var.rules)
    type = "ingress"
    from_port = var.rules[count.index].from_port
    to_port = var.rules[count.index].to_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = var.rules[count.index].description
    security_group_id =aws_security_group.allow_ssh.id
}