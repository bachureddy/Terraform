provider "aws" {
  region = "us-east-1"
  profile = "dev"
  alias = "dev"
}

provider "aws" {
  region = "us-west-2"
  profile = "dev"
  alias = "test"
}