export VAULT_ADDR=https://vault.ibeo.as/
value=$(cat $HOME/.vault-token 2>/dev/null)
export VAULT_TOKEN="$value"

alias terraform-test='terraform init -backend-config="address=https://perception-git.ibeo.as/api/v4/projects/818/terraform/state/test" -backend-config="lock_address=https://perception-git.ibeo.as/api/v4/projects/818/terraform/state/test/lock" -backend-config="unlock_address=https://perception-git.ibeo.as/api/v4/projects/818/terraform/state/test/lock" -backend-config="username=bsc" -backend-config="password=$GITLAB_ACCESS_TOKEN" -backend-config="lock_method=POST" -backend-config="unlock_method=DELETE" -backend-config="retry_wait_min=5"'
