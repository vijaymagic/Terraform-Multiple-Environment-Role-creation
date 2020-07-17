data "aws_iam_policy_document" "assume_role_with_saml" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithSAML"]

    principals {
      type        = "Federated"
      identifiers = ["${var.provider_id}"]
    }

    condition {
      test     = "StringEquals"
      variable = "SAML:aud"
      values   = ["${var.aws_saml_endpoint}"]
    }
  }
}


data "aws_iam_policy_document" "iam-pass-role-staging" {
  statement {
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = ["*"]
  }
}


data "aws_iam_policy_document" "iam-pass-role-production" {
  statement {
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "app-ops-policy-set-staging" {
  statement {
    effect = "Allow"
    actions = [
      "sns:*",
      "ec2:*",
      "cloudwatch:*",
      "sqs:*",
      "acm:*",
      "elasticloadbalancing:*"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "app-ops-policy-set-production" {
  statement {
    effect = "Allow"
    actions = [
      "iam:PassRole",
      "ecs:*",
      "eks:*",
      "ecr:*",
      "s3:*",
      "dynamodb:*",
      "opsworks:*",
    ]
    resources = ["*"]
  }
}

