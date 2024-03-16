resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}



module "example_ec2_instance" {
  source = "./modules/ec2_instance"

  ami_id          = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.instance_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              yum install -y example-package # Update with your package
              EOF
}


resource "aws_instance" "mysql_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.instance_sg.name]
}

resource "aws_lb" "web" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]

  listener {
    protocol = "HTTPS"
    port     = 443

    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.main.arn
    }
  }
}

resource "aws_lb_target_group" "main" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}