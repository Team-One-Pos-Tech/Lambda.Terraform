variable "LabRoleName" {
  description = "Name for the LabRole IAM role"
  default     = "LabRole"
}

variable "functionName" {
  description = "Name for the Lambda function"
  default     = "signup_lambda"
}

variable "clientId" {
  description = "Client ID for the Cognito User Pool"
}

variable "userPollId" {
  description = "Client Secret for the Cognito User Pool"
}

variable "regionDefault" {
  description = "Default region for the AWS provider"
  default     = "us-east-1"
}