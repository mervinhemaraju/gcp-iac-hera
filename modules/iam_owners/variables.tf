
variable "org_id" {
  description = "The organization ID."
  type        = string
}

variable "members" {
  description = "The list of members to add to the organization."
  type        = list(string)
}
