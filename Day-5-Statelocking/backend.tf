terraform {
  backend "s3" {
    bucket       = "prasanth-bachu-s3"
    key          = "day5/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  
  }
}
