variable "location" {
    description = "resource location"
    type        = string
}

variable "grp" {
    description    = "rg name" 
    type           = string
}

variable "ip_name" {
    description = "ip addr names"
    type        = list(string)
    default     = ["ansible-IP", "nginx-IP"]
}

variable "vnet_name" {
    description = "virtual network name"
    type        = string
    default     = "terr-ntwrk"
}

variable "vnet_addr" {
    description = "vnet address space"
    type        = string
    default     = "10.0.0.0/16"
}

variable "subnet_name" {
    description = "subnet name"
    type        = string
    default     = "main"
}

variable "subnet_addr" {
    description = "subnet address space"
    type        = string
    default     = "10.0.2.0/24"
}

variable "nic_name" {
    description = "nic names"
    type        = list(string)
    default     = ["ansible-NIC", "nginx-NIC"]
}

variable "sec_name" {
    description = "security group name"
    type        = string
    default     = "terr-nic"
}