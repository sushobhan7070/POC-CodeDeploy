
resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "${var.project}-artifacts"

  tags = {
    Name    = "${var.project}-artifact-bucket"
    Project = var.project
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.artifact_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.artifact_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
