data "archive_file" "lambda_zip" {
    type        = "zip"
    source_dir  = "lambda_function_payload.py"
    output_path = "lambda_function_payload.zip"
}
resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda-project"
  role          = "arn:aws:iam::697613968254:role/demo-Role"
  handler       = "lambda_function_payload.lambda_handler"
 source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)
 runtime = "python3.9"
 timeout = "840"
}
resource "aws_cloudwatch_event_rule" "lambda_function" {
    name = "lambda_function"
    description = "Fires when lambda creates"
     event_pattern = <<PATTERN
{
  "source": ["aws.lambda"]
}
PATTERN
}
resource "aws_cloudwatch_event_target" "event_target" {
    rule = aws_cloudwatch_event_rule.lambda_function.name
    target_id = "test_lambda"
    arn = aws_lambda_function.test_lambda.arn
}
resource "aws_lambda_permission" "allow_cloudwatch_to_call_test_lambda" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.test_lambda.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.lambda_function.arn
}
