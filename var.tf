variable "s3_main_bucket" {
  type    = string
  default = "demo.s3.bucketjune"
}

variable "lambda_iam_role_name" {
  type        = string
  description = "lamdaiamrole"
  default     = "lamdaiamrole"
}

variable "s3_lamda_trigger_name" {
  type        = string
  default     = "raja.lamda.testlamda"
  description = "s3_lamda_trigger_name"
}

variable "functionname" {
  type    = string
  default = "testlamda"
}

variable "create_bucket" {
  type    = bool
  default = true # Set to false if the bucket already exists
}