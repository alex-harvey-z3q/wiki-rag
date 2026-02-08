# wiki-rag-terraform

Terraform for a Wikipedia-as-Confluence RAG demo on AWS:
- S3 (raw + parsed)
- ECS Fargate (API + ingestion worker)
- RDS Postgres (for pgvector)
- Secrets Manager
- CloudWatch Logs
- EventBridge scheduled ingestion
- ALB for API

## Quickstart

Add secrets to Secrets Manager:

```bash
cat > /tmp/wiki-rag-app.json <<EOF
{
  "DB_PASSWORD": "your-postgres-password",
  "OPENAI_API_KEY": "sk-..."
}
EOF

manage_secrets.sh \
  -c wiki-rag/app \
  -D "Secrets for wiki-rag ECS tasks" \
  -s file:///tmp/wiki-rag-app.json
```

```bash
cd infra
terraform init
terraform apply
```

After apply, build and push two images to the printed ECR repos:
- api image -> `...-api:latest`
- ingest image -> `...-ingest:latest`
