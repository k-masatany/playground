resource "aws_rds_cluster" "efs-sample" {
  cluster_identifier              = "efs-sample"
  engine                          = "aurora-mysql"
  master_username                 = "efs_sample"
  master_password                 = "K#g.k.sd%iavN+9R"
  backup_retention_period         = "7"
  preferred_backup_window         = "19:30-20:00"
  preferred_maintenance_window    = "wed:20:15-wed:20:45"
  port                            = 3306
  vpc_security_group_ids          = ["${aws_security_group.efs-sample-rds.id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.efs-sample.name}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.efs-sample.name}"

  tags {
    Name = "efs-sample"
  }
}
