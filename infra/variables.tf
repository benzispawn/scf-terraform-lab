variable "project" {
  type        = string
  description = "Nome do projeto para tags e naming."
  default     = "scf-terraform-lab"
}

variable "owner" {
  type        = string
  description = "Owner tag."
  default     = "raphael"
}

variable "env" {
  type        = string
  description = "Ambiente (dev/prod)."
}

variable "aws_region" {
  type        = string
  description = "Região AWS."
  default     = "us-east-1"
}
