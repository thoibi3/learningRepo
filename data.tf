# data "aws_caller_identity" "current" {}



 data "aws_iam_role" "lambda_iamrolename" {
  name = "lamdaiamrole"
 }

#  data "aws_s3_bucket" "main_bucket" {
#  bucket = var.s3_main_bucket
#  }

data "archive_file" "zipfile" { 
type = "zip"
source_dir = "${path.module}/python/"
output_path = "${path.module}/python/handler.zip"

 }