#EC2 security groups:
# egress = all traffic,
# ingress locked internally to VPC and variable "myip" (default == 0.0.0.0/0 in tfvars)

resource "aws_security_group" "etcd" {
  name        = "TerraKube-Etcd"
  description = "Terrakube etcd security group"
  vpc_id      = "${var.vpcid}"

  ### Inbound rules

  # Allows inbound and outbound traffic from all instances in the VPC.
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.iplock}"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.iplock}"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.iplock}"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.iplock}"]
  }
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["${var.iplock}"]
  }

  #outbound rule, no port restrictions

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # for all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    KubernetesCluster = "${ var.name }"
    Name              = "worker-k8s-${ var.name }"
    builtWith         = "terraform"
  }
}
