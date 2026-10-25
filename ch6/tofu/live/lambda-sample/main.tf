provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn = "arn:aws:iam::${var.account_id}:role/OrganizationAccountAccessRole"
  }
}

module "function" {
  source = "brikis98/devops/book//modules/lambda"

  name    = var.name
  src_dir = "${path.module}/src"
  runtime = "nodejs20.x"
  handler = "index.handler"

  memory_size = var.memory_size
  timeout     = 5

  environment_variables = {
    NODE_ENV = "production"
    ENV_NAME = var.environment
  }
  create_url = true
}
