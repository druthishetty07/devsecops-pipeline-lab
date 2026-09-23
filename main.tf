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

# Create a secure cloud storage bucket (AWS S3)
resource "aws_s3_bucket" "dev_bucket" {
  bucket = "my-company-dev-bucket-12345"
}

# SECURITY FIX: Enabling all public access blocks (Secure by default!)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.dev_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# SECURITY BEST PRACTICE: Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.dev_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
