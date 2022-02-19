variable "filename" {
  type = string
  default = "lambda_function_payload.zip"
}
variable "function_name" {
  type = string
  default = "lambda-project"
}
variable "role" {
  type = string
  default = "arn:aws:iam::697613968254:role/demo-Role"
}
variable "handler" {
  type = string
  default = "lambda_function_payload.lambda_handler"
}
variable "source_code_hash" {
  type = string
  default = "lambda_function_payload.zip"
}
variable "runtime" {
  type = string
  default = "python3.9"
}
variable "timeout" {
  type = string
  default = "840"
}
variable "name" {
  type = string
  default = "lambda_function"
}
variable "description" {
  type = string
  default =  "description"
}
variable "schedule_expression" {
  type = string
  default = "rate(5 minutes)"
}
variable "target_id" {
  type = string
  default = "test_lambda"
}
variable "statement_id" {
  type = string
  default = "AllowExecutionFromCloudWatch"
}
variable "action" {
  type = string
  default = "lambda:InvokeFunction"
}
variable "principal" {
  type = string
  default = "events.amazonaws.com"
}
