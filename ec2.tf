resource "aws_instance" "web"{
    ami = "ami-0195204d5dce06d99"
    instance_type = "t2.micro"
}