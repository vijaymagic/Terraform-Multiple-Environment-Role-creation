variable "provider_id" {
  type        = string
  description = "describe your variable"
}

variable "aws_saml_endpoint" {
  type        = string
  description = "describe your variable"
  default     = "https://signin.aws.amazon.com/saml "
}

variable "environment" {
  type        = string
  description = "Please Select Your Environment production/staging"
}

variable "app-dev-role-name" {
  type        = string
  description = "describe your variable"
  default     = "App-Dev"
}

variable "app-ops-role-name" {
  type        = string
  description = "describe your variable"
  default     = "App-Ops"
}

variable "role-path" {
  type        = string
  description = "describe your variable"
  default     = "/"
}

variable "app-dev-aws-managed-policy-staging" {
  type        = list(string)
  description = "AWS Managed Policy for Staging App-Dev Role"
  default     = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

variable "app-dev-aws-managed-policy-production" {
  type        = list(string)
  description = "AWS Managed Policy for Production App-Dev Role"
  default     = ["arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/ReadOnlyAccess", "arn:aws:iam::aws:policy/Billing"]
}


variable "app-ops-aws-managed-policy-staging" {
  type        = list(string)
  description = "AWS Managed Policy for Staging App-Ops Role"
  default     = ["arn:aws:iam::aws:policy/AWSHealthFullAccess", "arn:aws:iam::aws:policy/AmazonKinesisFullAccess", "arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess"]
}

variable "app-ops-aws-managed-policy-production" {
  type        = list(string)
  description = "AWS Managed Policy for Production App-Ops Role"
  default     = ["arn:aws:iam::aws:policy/AWSHealthFullAccess", "arn:aws:iam::aws:policy/AmazonKinesisFullAccess", "arn:aws:iam::aws:policy/AmazonKinesisFirehoseFullAccess", "arn:aws:iam::aws:policy/AWSSupportAccess"]
}


variable "iam-pass-role" {
  type        = string
  description = "Custom App-Dev Policy"
  default     = "iam-pass-role-staging"
}

variable "app-ops-policy-set" {
  type        = string
  description = "Custom App-Ops Policy"
  default     = "app-ops-policy-set"
}


variable "max-session-duration" {
  type        = string
  description = "App-Dev & App-Ops Role Session Duration"
  default     = "3600"
}
