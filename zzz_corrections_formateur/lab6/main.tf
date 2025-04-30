resource "aws_s3_bucket" "example" {
  bucket = "terraform-user11-s3-bucket-19-07-2025"
  tags = {
    Name = "My bucket"
  }
}

resource "aws_s3_bucket_versioning" "example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Disabled"
  }
}



resource "aws_s3_bucket_object_lock_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}




