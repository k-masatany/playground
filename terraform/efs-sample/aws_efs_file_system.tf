resource "aws_efs_file_system" "efs-sample" {
  creation_token = "efs-sample"

  tags {
    Name = "efs-sample"
  }
}
