#### App-Dev Role Creation

resource "aws_iam_role" "app-dev" {
  name                 = var.app-dev-role-name
  path                 = var.role-path
  max_session_duration = var.max-session-duration
  assume_role_policy   = data.aws_iam_policy_document.assume_role_with_saml.json
}



resource "aws_iam_policy" "iam-pass-role" {
  name   = var.iam-pass-role
  path   = var.role-path
  policy = (var.environment == "production" ? data.aws_iam_policy_document.iam-pass-role-production.json : data.aws_iam_policy_document.iam-pass-role-staging.json)
}


resource "aws_iam_role_policy_attachment" "attach-app-dev" {
  role       = aws_iam_role.app-dev.name
  count      = (var.environment == "production" ? length(concat(var.app-dev-aws-managed-policy-production, [aws_iam_policy.iam-pass-role.arn])) : length(concat(var.app-dev-aws-managed-policy-staging, [aws_iam_policy.iam-pass-role.arn])))
  policy_arn = (var.environment == "production" ? concat(var.app-dev-aws-managed-policy-production, [aws_iam_policy.iam-pass-role.arn])[count.index] : concat(var.app-dev-aws-managed-policy-staging, [aws_iam_policy.iam-pass-role.arn])[count.index])

}


### App-Ops Role Creation ####
resource "aws_iam_role" "app-ops" {
  name                 = var.app-ops-role-name
  path                 = var.role-path
  max_session_duration = var.max-session-duration
  assume_role_policy   = data.aws_iam_policy_document.assume_role_with_saml.json
}


resource "aws_iam_policy" "app-ops-policy-set" {
  name   = var.app-ops-policy-set
  path   = var.role-path
  policy = (var.environment == "production" ? data.aws_iam_policy_document.app-ops-policy-set-production.json : data.aws_iam_policy_document.app-ops-policy-set-staging.json)
}


resource "aws_iam_role_policy_attachment" "attach-app-ops" {
  role       = aws_iam_role.app-ops.name
  count      = (var.environment == "production" ? length(concat(var.app-ops-aws-managed-policy-production, [aws_iam_policy.app-ops-policy-set.arn])) : length(concat(var.app-ops-aws-managed-policy-staging, [aws_iam_policy.app-ops-policy-set.arn])))
  policy_arn = (var.environment == "production" ? concat(var.app-ops-aws-managed-policy-production, [aws_iam_policy.app-ops-policy-set.arn])[count.index] : concat(var.app-ops-aws-managed-policy-staging, [aws_iam_policy.app-ops-policy-set.arn])[count.index])
}

