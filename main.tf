provider "aws"{
  region = "us-east-2"
}
module "lambda" {
  source = "git::https://github.com/Ramana4u/final_project.git?ref=module"
    }
