variable "instances"{
    type = list
    default = ["web-server","catalogue-server","cart-server"]
}

variable "is_env"{
    type = bool
    default = false
}

variable "servers"{
    type = map
    default = {
        "web-server" = "t2.micro"
        "cart-server" = "t3.micro"
        "catalogue-server" = "t3.medium"
    }
}

variable "instance_name"{
    type = string
    default = "web-server"
}

variable "environment"{
    type = string
    default = "prod"
}