output "api_url" {
  value = "http://${aws_lb.api.dns_name}"
}

output "raw_bucket" { value = aws_s3_bucket.raw.bucket }
output "parsed_bucket" { value = aws_s3_bucket.parsed.bucket }
output "db_endpoint" { value = aws_db_instance.postgres.address }
output "ecr_api" { value = aws_ecr_repository.api.repository_url }
output "ecr_ingest" { value = aws_ecr_repository.ingest.repository_url }
