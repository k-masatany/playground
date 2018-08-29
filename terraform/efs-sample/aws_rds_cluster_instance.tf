resource "aws_rds_cluster_instance" "efs-sample" {
  count                   = "${var.settings["needRDS"] == true ? 1 :0}"
  engine                  = "aurora-mysql"
  identifier              = "efs-sample"
  cluster_identifier      = "${aws_rds_cluster.efs-sample.id}"
  instance_class          = "db.t2.small"
  db_subnet_group_name    = "${aws_db_subnet_group.efs-sample.name}"
  db_parameter_group_name = "${aws_db_parameter_group.efs-sample.name}"

  tags {
    Name = "efs-sample"
  }
}
