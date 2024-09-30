resource "aws_apigatewayv2_api" "signup_lambda_api_gateway" {
  name          = "signup_lambda_http_api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "signup_lambda_api_gateway_stage" {
  api_id      = aws_apigatewayv2_api.signup_lambda_api_gateway.id
  name        = "Prod"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "signup_lambda_api_gateway_integration" {
  api_id                 = aws_apigatewayv2_api.signup_lambda_api_gateway.id
  integration_type       = "AWS_PROXY"
  integration_method     = "POST"
  integration_uri        = aws_lambda_function.signup_lambda.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "signup_lambda_api_gateway_route" {
  api_id    = aws_apigatewayv2_api.signup_lambda_api_gateway.id
  route_key = "POST /signup"
  target    = "integrations/${aws_apigatewayv2_integration.signup_lambda_api_gateway_integration.id}"
}

resource "aws_lambda_permission" "aws_lambda_api_gateway_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.signup_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.signup_lambda_api_gateway.execution_arn}/*/POST/signup"
}

output "aws_apigatewayv2_url" {
  value = aws_apigatewayv2_api.signup_lambda_api_gateway.api_endpoint
}