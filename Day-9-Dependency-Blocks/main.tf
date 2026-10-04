resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  depends_on = [aws_s3_bucket.my_bucket]
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-dependency-bucketfjkdsfhsfsfdsfdsdsfsdfgsdfs"
}