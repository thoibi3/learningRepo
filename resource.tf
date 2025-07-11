
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket        = var.s3_main_bucket
  force_destroy = true
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
  source_arn = aws_s3_bucket.my_s3_bucket.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket     = var.s3_main_bucket
  depends_on = [aws_lambda_permission.lambda_s3_invoke_perm]

  lambda_function {
    lambda_function_arn = "arn:aws:lambda:us-east-1:595374584249:function:${var.functionname}"
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

# resource "aws_cloudwatch_log_group" "log_group" {
#   name              = "/aws/lambda/my_lambda_function ${var.log_group_name}"
#   retention_in_days = 7
# }


