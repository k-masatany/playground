resource "aws_efs_mount_target" "efs-sample-a" {
  file_system_id  = "${aws_efs_file_system.efs-sample.id}"
  subnet_id       = "${aws_subnet.efs-sample-private-a.id}"
  security_groups = ["${aws_security_group.efs-sample-nfs.id}"]
}

resource "aws_efs_mount_target" "efs-sample-c" {
  file_system_id  = "${aws_efs_file_system.efs-sample.id}"
  subnet_id       = "${aws_subnet.efs-sample-private-c.id}"
  security_groups = ["${aws_security_group.efs-sample-nfs.id}"]
}

resource "aws_efs_mount_target" "efs-sample-d" {
  file_system_id  = "${aws_efs_file_system.efs-sample.id}"
  subnet_id       = "${aws_subnet.efs-sample-private-d.id}"
  security_groups = ["${aws_security_group.efs-sample-nfs.id}"]
}
