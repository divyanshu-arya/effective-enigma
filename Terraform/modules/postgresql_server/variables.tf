variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "administrator_login" {
  type = string
}

variable "administrator_password" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "virtual_network_id" {
  type = string
}

variable "delegated_subnet_id" {
  type = string
}

# variable "adf_subnet_id" {
#   type = string
# }