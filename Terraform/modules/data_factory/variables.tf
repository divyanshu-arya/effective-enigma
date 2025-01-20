variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "connection_string" {
  type = string
}

variable "postgres_connection_string" {
  type = string
}

variable "tags" {
  type = map(any)
}