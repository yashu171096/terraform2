output "ip_address"{
    value = aws_instance.web.public_ip
}

output "ami-ids"{
    value = data.aws_ami.info.image_id
}

output "current_region"{
    value = data.aws_region.current.name
}

output "vpc_info"{
    value = data.aws_vpc.existing_vpc
}