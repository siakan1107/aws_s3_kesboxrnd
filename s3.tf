resource "aws_s3_bucket" "s3_bucket_kb" {
  bucket = "my-tf-kb-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "test"
  }
}
