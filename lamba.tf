resource "aws_lambda_function" "test_lambda" {
  filename      = var.filename
  function_name = var.function_name
  role          = var.role
  handler       = var.handler
 source_code_hash = filebase64sha256(var.source_code_hash)
 runtime = var.runtime
 timeout = var.timeout
}
resource "aws_cloudwatch_event_rule" "lambda_function" {
    name = var.name
    description = var.description
    schedule_expression = var.schedule_expression
}
resource "aws_cloudwatch_event_target" "event_target" {
    rule = aws_cloudwatch_event_rule.lambda_function.name
    target_id = var.target_id
    arn = aws_lambda_function.test_lambda.arn
}
resource "aws_lambda_permission" "allow_cloudwatch_to_call_test_lambda" {
    statement_id = var.statement_id
    action = var.action
    function_name = aws_lambda_function.test_lambda.function_name
    principal = var.principal
    source_arn = aws_cloudwatch_event_rule.lambda_function.arn
}
