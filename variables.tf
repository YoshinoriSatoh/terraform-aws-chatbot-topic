variable "tf" {
  type = object({
    name          = string
    shortname     = string
    env           = string
    fullname      = string
    fullshortname = string
  })
}

variable "profile" {
  type    = string
  default = null
}

variable "region" {
  type    = string
}
