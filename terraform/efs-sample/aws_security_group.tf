resource "aws_security_group" "efs-sample-web" {
  name        = "efs-sample-web"
  description = "For efs-sample web ec2"
  vpc_id      = "${aws_vpc.efs-sample.id}"

  tags {
    "Name" = "efs-sample-web"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "efs-sample-web" {
  security_group_id = "${aws_security_group.efs-sample-web.id}"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "efs-sample-web-2" {
  security_group_id = "${aws_security_group.efs-sample-web.id}"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"

  cidr_blocks = ["116.94.0.124/32"]
}

resource "aws_security_group_rule" "efs-sample-web-3" {
  security_group_id = "${aws_security_group.efs-sample-web.id}"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "efs-sample-web-4" {
  security_group_id = "${aws_security_group.efs-sample-web.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "efs-sample-rds" {
  name        = "efs-sample-rds"
  description = "For efs-sample"
  vpc_id      = "${aws_vpc.efs-sample.id}"

  tags {
    "Name" = "efs-sample-rds"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "efs-sample-rds" {
  security_group_id        = "${aws_security_group.efs-sample-rds.id}"
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.efs-sample-web.id}"
}

resource "aws_security_group_rule" "efs-sample-rds-1" {
  security_group_id = "${aws_security_group.efs-sample-rds.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
}

resource "aws_security_group" "efs-sample-nfs" {
  name        = "efs-sample-nfs"
  description = "For efs-sample"
  vpc_id      = "${aws_vpc.efs-sample.id}"

  tags {
    "Name" = "efs-sample-nfs"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "efs-sample-nfs" {
  security_group_id = "${aws_security_group.efs-sample-nfs.id}"
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"]
}

resource "aws_security_group_rule" "efs-sample-nfs-1" {
  security_group_id = "${aws_security_group.efs-sample-nfs.id}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
}
