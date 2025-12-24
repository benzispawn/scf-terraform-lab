/*
  Milestone 1: módulo "casca".
  Milestone 3: aqui vamos criar a IAM Role da Lambda + policy mínima de logs.
*/
resource "aws_iam_role" "lambda_role" {
  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}
