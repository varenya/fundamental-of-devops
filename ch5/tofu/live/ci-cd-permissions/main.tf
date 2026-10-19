provider "aws" {
  region = "us-east-2"
}

module "oidc_provider" {
  source       = "brikis98/devops/book//modules/github-aws-oidc"
  version      = "1.0.0"
  provider_url = "https://token.actions.githubusercontent.com"
}

module "iam_roles" {
  source  = "brikis98/devops/book//modules/gh-actions-iam-roles"
  version = "1.0.0"

  name              = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn

  github_repo      = "varenya/fundamental-of-devops"
  lambda_base_name = "lambda-sample"

}
