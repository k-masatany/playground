resource "aws_internet_gateway" "efs-sample" {
  vpc_id = "${aws_vpc.efs-sample.id}"

  tags {
    "Name" = "efs-sample-igw"
  }
}
