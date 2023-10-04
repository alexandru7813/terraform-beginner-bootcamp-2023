output "random_bucket_name" {
  # value = random_string.bucket_name.result
  value = aws_s3_bucket.website_bucket.bucket
}
