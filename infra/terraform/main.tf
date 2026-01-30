# Portfolio example: show a simple, low-risk resource pattern.
# NOTE: To actually apply, you must have AWS credentials configured.

resource "aws_s3_bucket" "portfolio_bucket" {
  bucket_prefix = "cloud-sre-portfolio-"
  force_destroy = true
}

output "bucket_name" {
  value = aws_s3_bucket.portfolio_bucket.bucket
}

