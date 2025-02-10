
variable "vault_username"  {
  description = "Vault Username"
  type        = string
}
variable "vault_password" {
  description = "Vault Password"
  type        = string
}
variable "secret_infra_path" {
  description = "Path of the Secret Engine where Infrastructure Secret are stored"
  type        = string
}
variable "secret_infra_name" {
  description = "Name of the Secret Engine where Infrastructure Secret are stored"
  type        = string
}

provider "vault" {
  auth_login {
    path = "auth/userpass/login/${var.vault_username}"

    parameters = {
      password = var.vault_password
    }
  }
}

data "vault_kv_secret_v2" "infra_secrets" {
  mount = var.secret_infra_path
  name  = var.secret_infra_name
}

output "infra_secrets" {
  value = nonsentitive(data.vault_kv_secret_v2.infra_secrets.data)
}
