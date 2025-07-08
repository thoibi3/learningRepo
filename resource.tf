
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket        = var.s3_main_bucket
  force_destroy = true
  count         = var.create_bucket ? 1 : 0
}


resource "aws_lambda_function" "createlamda" {
  filename      = "${path.module}/python/handler.zip"
  function_name = var.functionname
  role          = data.aws_iam_role.lambda_iamrolename.arn
  handler       = "lamdahandler.handler"
  runtime       = "python3.9"
}


resource "aws_lambda_permission" "lambda_s3_invoke_perm" {
  statement_id   = "AllowS3Invoke"
  action         = "lambda:InvokeFunction"
  function_name  = var.functionname
  principal      = "s3.amazonaws.com"
  source_account = "595374584249"
  # source_arn     = aws_s3_bucket.my_s3_bucket.arn
  source_arn = var.create_bucket ? aws_s3_bucket.my_s3_bucket[0].arn : "arn:aws:s3:::${var.s3_main_bucket}"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket     = var.s3_main_bucket
  depends_on = [aws_lambda_permission.lambda_s3_invoke_perm]

  lambda_function {
    lambda_function_arn = "arn:aws:lambda:us-east-1:595374584249:function:testlamda"
    events              = ["s3:ObjectCreated:*"]
    #  filter_prefix =  "inputFiles/"

  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = var.s3_main_bucket
  versioning_configuration {
    status = "Enabled"
  }
}