locals {
  db1 = "localhost"
}

module "ai-database" {
  source = "../modules/managed-database"

  name          = "ai-data"
  host          = local.db1
  vault_backend = module.vault.backend_db
}

module "tp-database" {
  source = "../modules/managed-database"

  name          = "tp-data"
  host          = local.db1
  vault_backend = module.vault.backend_db
}
