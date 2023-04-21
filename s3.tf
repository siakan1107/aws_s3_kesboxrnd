resource "aws_s3_bucket" "s3_bucket_kb" {
  bucket = "my-tf-kb-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "test"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_kesboxcoe" {
  bucket = aws_s3_bucket.s3_bucket_kb.id
  policy = data.aws_iam_policy_document.allow_access_from_kesboxcoe.json
}

data "aws_iam_policy_document" "allow_access_from_kesboxcoe" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::789535401130:role/CCOE"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject"
    ]

    resources = [
      aws_s3_bucket.s3_bucket_kb.arn,
      "${aws_s3_bucket.s3_bucket_kb.arn}/*",
    ]
  }
}
