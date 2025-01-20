variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "service_plan_id" {
  type = string
}

variable "web_app_virtual_network_subnet_id" {
  type = string
}

variable "tags" {
  type = map(any)
}