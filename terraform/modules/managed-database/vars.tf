# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "database name to create"
  type        = string
}

variable "host" {
  type = string
}
variable "port" {
  type    = number
  default = 5432
}

variable "vault_backend" {
  description = "Vault secret store"
}
