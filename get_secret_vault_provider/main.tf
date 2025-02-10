provider "vault" {
  auth_login = "userpass"
}

variable "secret_infra_path" {
  description = "Path of the Secret Engine where Infrastructure Secret are stored"
  type        = string
}
variable "secret_infra_name" {
  description = "Name of the Secret Engine where Infrastructure Secret are stored"
  type        = string
}

data "vault_kv_secret_v2" "infra_secrets" {
  mount = var.secret_infra_path
  name  = var.secret_infra_name
}

output "infra_secrets" {
  value = data.vault_kv_secret_v2.infra_secrets.data
}
