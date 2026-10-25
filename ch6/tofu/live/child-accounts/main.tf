provider "aws" {
  region = "us-east-2"
}

module "child_accounts" {
  source              = "brikis98/devops/book//modules/aws-organizations"
  version             = "1.0.0"
  create_organization = true

  accounts = {
    development = "varenya.thyagaraj+dev@outlook.com"
    staging     = "varenya.thyagaraj+stage@outlook.com"
    production  = "varenya.thyagaraj+prod@outlook.com"
  }
}
