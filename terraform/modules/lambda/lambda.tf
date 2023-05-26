data "archive_file" "lambda" {
  type        = "zip"
  source_file = "/Users/gurudeepmachupalli/Documents/Repositories/AWS-lambda-practice/lambda.py"
  output_path = "lambda_function_payload.zip"
}

resource "aws_lambda_function" "lambda_practice" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_practice"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "lambda.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.10"

  environment {
    variables = {
      foo = "bar"
    }
  }
}