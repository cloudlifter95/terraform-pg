variable "custom_tags" {
  description = "A map of custom tags to assign to resources. Tags will be added on top of mandatory tags."
  type        = map(string)
  default     = {}
}

variable "delay_seconds" {
  description = "Delay in seconds"
  type        = number
  default     = 90
}
