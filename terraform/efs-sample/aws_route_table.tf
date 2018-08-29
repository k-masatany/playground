resource "aws_route_table" "efs-sample" {
  vpc_id = "${aws_vpc.efs-sample.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.efs-sample.id}"
  }

  tags {
    "Name" = "efs-sample-rtb"
  }
}

resource "aws_route" "efs-sample" {
  route_table_id         = "${aws_route_table.efs-sample.id}"
  gateway_id             = "${aws_internet_gateway.efs-sample.id}"
  destination_cidr_block = "0.0.0.0/0"
}
