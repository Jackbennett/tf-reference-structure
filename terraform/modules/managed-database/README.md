TF config as a reference, config performed manually following;

- https://learn.hashicorp.com/tutorials/vault/database-secrets
- https://blog.baens.net/posts/postgres-vault-dev-workspace/

# How

1. Setup postgres
   1. create db
   2. create role
1. setup vault
   1. attach db
   1. config templates to add generated users to roles.
