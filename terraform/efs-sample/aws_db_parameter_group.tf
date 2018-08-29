resource "aws_db_parameter_group" "efs-sample" {
  name        = "efs-sample"
  family      = "aurora-mysql5.7"
  description = "Parameter Group for mysql autota"

  tags {
    Name = "efs-sample"
  }
}
