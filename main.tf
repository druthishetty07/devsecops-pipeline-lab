# Specify the cloud provider (AWS)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create a cloud storage bucket (AWS S3)
resource "aws_s3_bucket" "dev_bucket" {
  bucket = "my-company-dev-bucket-12345"
}

# VULNERABILITY: Enabling public access (Insecure on purpose!)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.dev_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
