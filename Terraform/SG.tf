resource "aws_security_group" "Netflix-SG" {
  name        = "Netflix-SG"
  description = "Allowed ports (22,80,443,8080,8081,9000) inbound traffic"

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { 
    protocol = "tcp"
    from_port = 443
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins port"
    protocol = "tcp"
    from_port = 8080
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Sonarqube port"
    protocol = "tcp"
    from_port = 9000
    to_port   = 9000
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Netflix Application port"
    protocol = "tcp"
    from_port = 8081
    to_port   = 8081
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

 resource "aws_security_group" "Monitoring-SG" {
  name        = "Monitoring-SG"
  description = "Allowed ports (22,3000,9090) inbound traffic"
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "grafana port"
    protocol = "tcp"
    from_port = 3000
    to_port   = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "prometheus port"
    protocol = "tcp"
    from_port = 9090
    to_port   = 9090
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Node_exporter port"
    protocol = "tcp"
    from_port = 9100
    to_port = 9100
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Jenkins port"
    protocol = "tcp"
    from_port = 8080
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   
 }