resource "aws_s3_bucket" "bucket_user_10_yti" {
  bucket = "bucket-user-10-yti"
  
  tags = {
    Name = "Bucket user 10"
    Environment = "Dev"
  }

} 
