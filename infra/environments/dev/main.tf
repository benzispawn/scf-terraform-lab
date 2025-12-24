module "iam" {
  source = "../../modules/iam"
  name   = "scf-fn-dev-role"
  tags   = local.common_tags
}

module "lambda" {
  source        = "../../modules/lambda"
  function_name = "scf-fn-dev"
  role_arn      = module.iam.role_arn
  tags          = local.common_tags
}

module "apigw" {
  source = "../../modules/apigw"
  name   = "scf-fn-dev"
  tags   = local.common_tags
}

module "observability" {
  source = "../../modules/observability"
  name   = "scf-fn-dev"
  tags   = local.common_tags
}
