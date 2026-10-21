provider "aws" {
  region = "us-east-2"
}

module "oidc_provider" {
  source       = "brikis98/devops/book//modules/github-aws-oidc"
  version      = "1.0.0"
  provider_url = "https://token.actions.githubusercontent.com"
}

module "iam_roles" {
  source = "brikis98/devops/book//modules/gh-actions-iam-roles"

  name              = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn

  enable_iam_role_for_testing = true
  enable_iam_role_for_apply   = true
  enable_iam_role_for_plan    = true

  tofu_state_bucket         = "fundamentals-of-devops-tofu-state-vtr"
  tofu_state_dynamodb_table = "fundamentals-of-devops-tofu-state-vtr"



  github_repo      = "varenya@4066143/fundamental-of-devops@1424610216"
  lambda_base_name = "lambda-sample"

}
