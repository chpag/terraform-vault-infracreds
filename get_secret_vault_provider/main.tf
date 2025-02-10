provider "vault" {

}

variable "secret_infra_path" {
  description = "Path of the Secret Engine where Infrastructure Secret are stored"
  type        = string
}
variable "secret_infra_path" {
  description = "Name of the Secret Engine where Infrastructure Secret are stored"
  type        = string
}

data "vault_kv_secret_v2" "example" {
  mount = var.secret_infra_path
  name  = var.secret_infra_name
}
