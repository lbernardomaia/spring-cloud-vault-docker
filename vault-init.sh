#!/bin/sh

# Create Secrets for secret/infrastructure/dev/spring-cloud-vault-docker path
vault kv put -mount=secret infrastructure/dev/spring-cloud-vault-docker password=dev-password-from-vault

# Create Secrets for secret/infrastructure/prod/spring-cloud-vault-docker path
vault kv put -mount=secret infrastructure/prod/spring-cloud-vault-docker password=cloud-password-from-vault

# Create Policies
echo "path \"secret/*\" {
  capabilities = [
    \"create\",
    \"read\",
    \"list\",
    \"update\",
    \"delete\",
  ]
}" > policy.hcl

vault policy write spring-cloud-vault-docker-policy ./policy.hcl

# Enable AppRole
vault auth enable approle

# Create Role
vault write auth/approle/role/my-role \
    secret_id_ttl=20m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=20m \
    secret_id_num_uses=40 \
    policies=spring-cloud-vault-docker-policy

# Get the Role ID
echo  "######ROLE ID######R"
vault read auth/approle/role/my-role/role-id

# Get the secret ID
echo  "######SECRET ID######R"
vault write -f auth/approle/role/my-role/secret-id