variable "tags"{
    type = map
}

variable "cidr_block"{
    type = string
}

variable "public_subnet_cidr"{
    type = string
}

variable "private_subnet_cidr"{
    type = string
}

variable "internet_cidr"{
    type = string
}

variable "nat_cidr"{
    type = string
}
