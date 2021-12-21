variable "ami_name" {
  type    = string
  default = "ami-0997f8647e96c0857"
}

variable "type" {
  type    = string
  default = "t3.medium"
}

variable "keyname" {
  type    = string
  default = "priv.pem"
}

variable "myvpc" {
  type    = string
}

variable "my-subnet" {
  type    = string
}

variable "my-sg" {
  type    = string
}
