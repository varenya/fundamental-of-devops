terraform {
  backend "s3" {
    bucket         = "fundamentals-of-devops-tofu-state-vtr"
    key            = "ch5/tofu/live/lambda-sample/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "fundamentals-of-devops-tofu-state-vtr"
  }
}
