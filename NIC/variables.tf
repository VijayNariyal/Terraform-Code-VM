variable "resource_group_name" {
    description = "The location of the resource group"
    type        = string
}
variable "resource_group_location" {
    description = "The name of the resource group"
    type        = string
}
variable "network_interface_name" {
  description = "value of the network security group name"
    type        = string
}
variable "subnet_name" {
    description = "The name of the subnet"
    type        = string
}
variable "virtual_network_name" {
    description = "The name of the virtual network"
    type        = string     
}
variable "public_ip_name" {
    description = "The name of the public IP address"
    type        = string
}
variable "nsg_name" {
    description = "The name of the network security group"
    type        = string
  
}