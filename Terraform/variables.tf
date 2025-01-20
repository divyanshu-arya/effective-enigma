variable "env" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "administrator_login" {
  type = string
}

variable "administrator_password" {
  type = string
}

variable "function_type" {
  type = set(string)
  default = [ "distribution", "illustration", "statement" ]
}