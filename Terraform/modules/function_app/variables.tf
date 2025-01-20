


variable "env" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "primary_access_key" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "function_type" {
  type = object({
    name = string
    tags = map(string)
  })
}