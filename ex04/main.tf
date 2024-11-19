provider "azurerm" {  # declaring the cloud provider
  features {}
  subscription_id = "0f519cc7-9081-446a-9220-3cbc54c8d404"  # Optional if you have 'az login' configured
}
 
resource "azurerm_resource_group" "rg01" {  # creating a new resource group
  location = var.location
  name     = var.rg_name
  tags = {
    env   = var.tag_env
    dep   = var.tag_dep
    owner = var.tag_owner
    proj1 = var.tag_proj1
  }
}
 
resource "azurerm_virtual_network" "vnet01" {  # defining the virtual network
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  name                = var.vnet_name
  # Multiple address spaces can be defined here
  address_space = [var.loc_as[var.location]]
  tags = {
    env   = var.tag_env
    dep   = var.tag_dep
    owner = var.tag_owner
    proj1 = var.tag_proj1
  }
}

