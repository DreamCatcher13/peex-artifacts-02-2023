variable "location" {
    description = "resource location"
    type        = string
}

variable "grp" {
    description = "rg name"
    type        = string
}

variable "nic_ids" {
    description = "NIC IDs"
    type        = list(string)
}

variable "subnet_id" {
    description = "subnet id"
    type        = string
}

variable "vm_names" {
    description = "VM names"
    type        = list(string)
    default     = ["ansible-vm", "nginx-vm"]
}

variable "user" {
    description = "VM user"
    type        = string
    default     = "rand"
}

variable "pass" {
    description = "VM user's password"
    type        = string
    default     = "Mys3cur3pa55"
}

variable "tags" {
    description = "VM tags"
    type        = list(string)
    default     = ["ansible", "nginx"]
}