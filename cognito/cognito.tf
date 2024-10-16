resource "aws_cognito_user_pool_client" "client" {
  name = "client"

  user_pool_id = aws_cognito_user_pool.pool.id
}

resource "aws_cognito_user_pool" "pool" {
  name = "snack-hub-users"

  schema {
    name = "CPF"
    attribute_data_type = "String"
    mutable = true
    required = false
  }
}

output "user_pool_id" {
  value = aws_cognito_user_pool.pool.id
  description = "Use this ID in GitHub Secrets for Sign Lambdas functions"
  sensitive = false
}

output "client_id" {
  value = aws_cognito_user_pool_client.client.id
  description = "Use this ID in GitHub Secrets for Sign Lambdas functions"
  sensitive = false
}