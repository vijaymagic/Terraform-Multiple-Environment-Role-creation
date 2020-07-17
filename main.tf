provider "aws" {
  region = "eu-west-1"
}


module "sso_iam_role_creation" {
  source      = "./role"
  provider_id = var.idp_provider_arn
  environment = var.environment
}
