variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

# variable "virtual_network_subnet_ids" {
#   type = string
# }

variable "dbPassword" {
  type = string
}

variable "tags" {
  type = map(any)
}