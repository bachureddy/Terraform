resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  provider = aws.dev
  tags = {
    Name = "main_vpc"
  }
}

resource "aws_s3_bucket" "main" {
  provider = aws.test
  bucket = "my-main-bucketdfdsfsdsfsfsfs"
  tags = {
    Name = "main_s3_bucket"
  }
}