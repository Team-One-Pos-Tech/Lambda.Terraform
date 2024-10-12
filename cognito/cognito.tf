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