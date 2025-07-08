variable "s3_main_bucket" {
  type    = string
  default = "demmobucket"
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


