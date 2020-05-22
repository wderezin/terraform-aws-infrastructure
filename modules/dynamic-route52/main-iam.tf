
data aws_iam_policy_document policy {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = ["ec2:Describe*"]
    resources = ["*"]
  }
}

{
"Effect": "Allow",
"Action": [
"dynamodb:*"
],
"Resource": "*"
}, {
"Effect": "Allow",
"Action": [
"logs:CreateLogGroup",
"logs:CreateLogStream",
"logs:PutLogEvents"
],
"Resource": "*"
}, {
"Effect": "Allow",
"Action": [
"route53:*"
],
"Resource": [
"*"
]
}]
}