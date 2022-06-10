# Dev Network Foundation

- Root CA for Vault Cluster

# Provides

- Vault
  - Internal TLS certificates
  - Internal Secret Storage

## Contents

### Terraform

Modules and config used to spin up initial services.

- TF config of vault, roles , secrets etc.
- TF postgres config - linked to vault for acl.
- TF private TLS key.
