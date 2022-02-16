resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = "arn:aws:iam::697613968254:role/demo-Role"
  handler       = "index.test"
 source_code_hash = filebase64sha256("lambda_function_payload.zip")
 runtime = "python3.9"
 timeout = "840"
}
