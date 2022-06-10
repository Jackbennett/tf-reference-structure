variable "vault" { default = "https://demo" }
variable "token" { default = "demo" }
variable "token_name" { default = "demo" }

# provider "vault" {
#   # addres must be IP as TF bootraps the cert & name.
#   address         = var.vault
#   skip_tls_verify = true
#   token           = var.token
#   token_name      = var.token_name
# }

# module "vault" {
#   source = "../modules/vault"
# }
