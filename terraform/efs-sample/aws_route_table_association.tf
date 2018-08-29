resource "aws_route_table_association" "efs-sample-rtb-public-a" {
  route_table_id = "${aws_route_table.efs-sample.id}"
  subnet_id      = "${aws_subnet.efs-sample-public-a.id}"
}

resource "aws_route_table_association" "efs-sample-rtb-public-c" {
  route_table_id = "${aws_route_table.efs-sample.id}"
  subnet_id      = "${aws_subnet.efs-sample-public-c.id}"
}
