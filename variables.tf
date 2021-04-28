variable "ami" {
  type = string
}
variable "instance_type" {
  type = string
}

variable "key_pair_public_ssh_key" {
  type      = string
  sensitive = true
}
variable "key_pair_name" {
  type = string
}
variable "allowed_ip" {
  type = string
}
variable "tag_name" {
  type = string
}
variable "region" {
  type = string
}