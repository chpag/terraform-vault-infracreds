variable "test" {
  type = string
  default = "demo"
}


output "infra_secrets" {
  value = var.test
}
