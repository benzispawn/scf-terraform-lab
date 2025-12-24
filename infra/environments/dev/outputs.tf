output "function_name" {
  value = module.lambda.function_name
}

output "role_arn" {
  value = module.iam.role_arn
}

output "invoke_url" {
  value = module.apigw.invoke_url
}
