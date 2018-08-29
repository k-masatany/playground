resource "aws_db_subnet_group" "efs-sample" {
  name        = "efs-sample"
  description = "efs-sample"
  subnet_ids  = ["${aws_subnet.efs-sample-private-a.id}", "${aws_subnet.efs-sample-private-c.id}", "${aws_subnet.efs-sample-private-d.id}"]
}
