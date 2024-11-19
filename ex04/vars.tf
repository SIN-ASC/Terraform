variable "tag_dep" {
    type = string
    default = "finance"
}

variable "tag_owner" { 
    default = "Gourav Sinha"
}

variable "tag_env" {
  default = "dev"
  validation {
    condition = contains(["dev","uat","prod"], var.tag_env)
    error_message = "The env variables must be dev, uat or prod only"
  }
}

variable "tag_proj1" {
  default = "p1"
}

variable "location" {
    default = "EAST US"
}

variable "rg_name" {
    default = "rg01-TF1"
}

variable "vnet_name" {
  default = "Vnet01-TF-ex011"
}

variable "add_spc" {
    type = list
    default = [
    "10.10.0.0/16"
  ]
}
variable "loc_as" {
    type = map
    default = {
        "East US" = "10.10.0.0/16"
        "West US" = "10.11.0.0/16"
    }
}