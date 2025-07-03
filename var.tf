variable "s3_main_bucket" {
  type        = string
  description = "raja.s3.newbucket"
  default     = "raja.s3.newbucket"
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





