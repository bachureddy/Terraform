data "aws_subnet" "name" {
    filter {
        name   = "tag:Name"
      values = ["dev"]
    }
}



resource "aws_instance" "example" {
  ami           = "ami-0d27e0fb3bac4d724" # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.name.id
}