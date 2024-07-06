resource "aws_vpc" "main"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "automated-vpc"
    }
}

resource "aws_subnet" "public"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "auto-public-subnet"
    }
}

resource "aws_subnet" "private"{
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "auto-private-subnet"
    }
}

resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.main.id
    tags = {
        Name = " automated-internet-gateway"
    }
}

resource "aws_eip" "eip"{
    tags = {
        Name = "auto-eip"
    }
}

resource "aws_nat_gateway" "nat"{
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.public.id
    tags = {
        Name = "auto-nat"
    }
    depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public"{
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    
    tags = {
        Name = "auto-public-route"
    }
}

resource "aws_route_table" "private"{
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
    }

    tags = {
        Name = "auto-private-route"
    }
}

resource "aws_route_table_association" "public"{
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private"{
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}
