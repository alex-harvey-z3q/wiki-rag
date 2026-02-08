variable "db_username" {
  type        = string
  default     = "wikirdb"
  description = "Username for the PostgreSQL database used by the RAG application."
}

variable "ingest_schedule" {
  type        = string
  default     = "rate(6 hours)"
  description = "EventBridge schedule expression controlling how often the Wikipedia ingestion task runs."
}
