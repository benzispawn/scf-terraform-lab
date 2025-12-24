locals {
    common_tags = {
        Project     = var.owner
        Environment = "Production"
        Owner       = "DevOpsTeam"
    }
}