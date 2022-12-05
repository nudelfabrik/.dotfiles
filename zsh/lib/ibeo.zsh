export VAULT_ADDR=https://vault.ibeo.as/
value=$(cat $HOME/.vault-token 2>/dev/null)
export VAULT_TOKEN="$value"
