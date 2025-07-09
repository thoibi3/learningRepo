variable "s3_main_bucket" {
  type    = string
  default = "demo.s3.bucketmain"
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
  default = "testlamdat"
}

variable "create_bucket" {
  type    = bool
  default = true
}

variable "log_group_name" {
  type    = string
  default = "groupnametest"
}