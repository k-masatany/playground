resource "aws_subnet" "efs-sample-private-a" {
  vpc_id                  = "${aws_vpc.efs-sample.id}"
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = false

  tags {
    Name = "efs-sample-private-a"
  }
}

resource "aws_subnet" "efs-sample-private-c" {
  vpc_id                  = "${aws_vpc.efs-sample.id}"
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = false

  tags {
    Name = "efs-sample-private-c"
  }
}

resource "aws_subnet" "efs-sample-private-d" {
  vpc_id                  = "${aws_vpc.efs-sample.id}"
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = false

  tags {
    Name = "efs-sample-private-d"
  }
}

resource "aws_subnet" "efs-sample-public-a" {
  vpc_id                  = "${aws_vpc.efs-sample.id}"
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags {
    Name = "efs-sample-public-a"
  }
}

resource "aws_subnet" "efs-sample-public-c" {
  vpc_id                  = "${aws_vpc.efs-sample.id}"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags {
    Name = "efs-sample-public-c"
  }
}

resource "aws_subnet" "efs-sample-public-d" {
  vpc_id                  = "${aws_vpc.efs-sample.id}"
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = true

  tags {
    Name = "efs-sample-public-d"
  }
}
