resource "aws_iam_user" "user" {
  name = "test_kb"
}

data "aws_iam_policy_document" "user_policy" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::789535401130:role/EC2S3readOnly_kb"]
  }
}

resource "aws_iam_user_policy" "user_policy" {
  name   = "test_kb_policy"
  user   = aws_iam_user.user.name
  policy = data.aws_iam_policy_document.user_policy.json
}

resource "aws_iam_user_policy" "user_policy_2" {
  user   = aws_iam_user.user.name
  policy = data.aws_iam_policy.user_policy_2.json
}

data "aws_iam_policy" "user_policy_2" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"  
}  
