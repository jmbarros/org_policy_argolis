variable "organizacao" {
    type = string
    nullable = false
}

variable "projeto" {
    type = string
    nullable = false
}



module "org-policy0" {
  source  = "terraform-google-modules/org-policy/google"
  version = "5.1.0"
  
  
  constraint        = "constraints/compute.requireOsLogin"
  policy_for        = "project"
  policy_type       = "boolean"
  organization_id   = var.organizacao
  project_id        = var.projeto
  enforce           = false
}

module "org-policy1" {
  source  = "terraform-google-modules/org-policy/google"
  version = "5.1.0"

  constraint        = "constraints/compute.vmExternalIpAccess"
  policy_for        = "project"
  policy_type       = "list"
  organization_id   = var.organizacao
  project_id        = var.projeto
  enforce           = false
}

module "org-policy2" {
  source  = "terraform-google-modules/org-policy/google"
  version = "5.1.0"
  
  
  constraint        = "constraints/compute.requireShieldedVm"
  policy_for        = "project"
  policy_type       = "boolean"
  organization_id   = var.organizacao
  project_id        = var.projeto
  enforce           = false
}