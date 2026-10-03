

resource "aws_instance" "my_instance" {
  ami           = "ami-0d27e0fb3bacd724"
  instance_type = "t2.micro"

#   lifecycle {
#     create_before_destroy = true
#   }
#  lifecycle {
#    prevent_destroy = true
#  }

 lifecycle {
   ignore_changes = [ instance_type ]
 }

}