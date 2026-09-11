resource "aws_instance" "ec2"{
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    key_name = "mumbai"
    tags = {
        Name = "ec2"
    }

    provisioner "file" {
        source = "file.txt"
        destination = "/home/ubuntu/file.txt"

    connection {
        type     = "ssh"
        user     = "ubuntu"
        private_key = file("/root/Meeting-Terraform/provisioner/mumbai.pem")
        host        = self.public_ip
        }
        
    }
}