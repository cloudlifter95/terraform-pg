variable "custom_tags" {
  description = "A map of custom tags to assign to resources. Tags will be added on top of mandatory tags."
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t3.micro"
}

variable "ssh_active" {
  description = "Activate ssh"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "ID of subnet"
  type        = string
  default     = ""
}

variable "public_access" {
  description = "Enable public access"
  type        = bool
  default     = true
}