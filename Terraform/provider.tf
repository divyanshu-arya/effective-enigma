terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # version = "~> 3.102.0"
      version = "~> 3.116.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Dev"                             # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "devstorageaccount"                # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "terraform-state"                      # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "terraform.tfstate"                    # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    use_oidc             = true                                   # Can also be set via `ARM_USE_OIDC` environment variable.
    client_id            = "" # Can also be set via `ARM_CLIENT_ID` environment variable.
    subscription_id      = "" # Can also be set via `ARM_SUBSCRIPTION_ID` environment variable.
    tenant_id            = "" # Can also be set via `ARM_TENANT_ID` environment variable.
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = false
    }
  }
}