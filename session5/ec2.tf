# resource "aws_instance" "web"{
#     ami = "ami-03972092c42e8c0ca"
#     instance_type = "t2.micro"
#     count = length(var.instances)
#     tags = {
#         Name = var.instances[count.index]
#     }
# }

# resource "aws_instance" "web"{
#     ami = "ami-03972092c42e8c0ca"
#     instance_type = var.is_env ? "t2.micro" : "t3.micro"
# }

# resource "aws_instance" "web"{
#     for_each = var.servers
#     ami = "ami-03972092c42e8c0ca"
#     instance_type = each.value
#     tags = {
#         Name = each.key
#     }
# }

resource "aws_instance" "web"{
    ami = "ami-03972092c42e8c0ca"
    instance_type = "t2.micro"
    tags = {
        Name = local.instance_name
    }
}