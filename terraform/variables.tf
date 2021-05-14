variable "rg-name" {}
variable "storage-account-name" {}
variable "client-id" {}
variable "client-secret" {}
variable "subscription-id" {}
variable "tenant-id" {}
variable "container-name" {
    type = list(string)
}