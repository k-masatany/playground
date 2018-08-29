locals {
  az = [
    "ap-northeast-1a",
    "ap-northeast-1c",
    "ap-northeast-1d",
  ]

  subnet = [
    "${aws_subnet.efs-sample-public-a.id}",
    "${aws_subnet.efs-sample-public-c.id}",
    "${aws_subnet.efs-sample-public-d.id}",
  ]
}

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata/efs-sample.tpl")}"

  vars {
    file_system_id = "${aws_efs_file_system.efs-sample.id}"
    efs_directory  = "/mnt/efs"
  }
}

resource "aws_iam_instance_profile" "efs-sample" {
  name = "efs-sample"
  role = "${aws_iam_role.efs-sample.name}"
}

resource "aws_instance" "efs-sample" {
  count                       = "2"
  ami                         = "ami-0041c416aa23033a2"
  availability_zone           = "${local.az[count.index]}"
  ebs_optimized               = false
  instance_type               = "t2.nano"
  monitoring                  = false
  key_name                    = "my-instance-key"
  subnet_id                   = "${local.subnet[count.index]}"
  vpc_security_group_ids      = ["${aws_security_group.efs-sample-web.id}"]
  associate_public_ip_address = true
  source_dest_check           = true
  user_data                   = "${data.template_file.userdata.rendered}"
  iam_instance_profile        = "${aws_iam_instance_profile.efs-sample.name}"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = true
  }

  tags {
    "Name" = "efs-sample-${count.index}"
  }
}
