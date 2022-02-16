provider "aws"{
  region = "us-east-2"
}
module "lambda" {
  source = "git::https://github.com/Ramana4u/test1.git?ref=main2"
    }
