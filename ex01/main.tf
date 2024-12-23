provider "azurerm" {  # declaring the cloud provider
  features {}
  subscription_id = "0f519cc7-9081-446a-9220-3cbc54c8d404"  # Optional if you have 'az login' configured
}
 
resource "azurerm_resource_group" "rg01" {  # creating a new resource group
  location = "East US"
  name     = "rg01-TF"
  tags = {
    env   = "dev"
    dep   = "finance"
    owner = "Gourav"
    proj1 = "p1"
  }
}
 
resource "azurerm_virtual_network" "vnet01" {  # defining the virtual network
  location            = azurerm_resource_group.rg01.location
  resource_group_name = azurerm_resource_group.rg01.name
  name                = "Vnet01-TF-ex01"
  # Multiple address spaces can be defined here
  address_space = [
    "10.10.0.0/16",
    "10.20.1.0/24",  # Additional address space
    "10.20.2.0/24"   # Additional address space
  ]
  tags = {
    env   = "dev"
    dep   = "finance"
    owner = "Gourav"
    proj1 = "p1"
  }
}
# Subnet 1
resource "azurerm_subnet" "subnet01" {
  name                 = "subnet01"
  resource_group_name  = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.20.1.0/25"]  # First subnet, using part of 10.20.1.0/24
}
 
# Subnet 2
resource "azurerm_subnet" "subnet02" {
  name                 = "subnet02"
  resource_group_name  = azurerm_resource_group.rg01.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.20.1.128/25"]  # Second subnet, using the remaining part of 10.20.1.0/24
}
