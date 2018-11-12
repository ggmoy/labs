variable "aws_region" {
    description = "AWS region to launch servers."
    default     = "us-east-2"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default     = "hashilab"
}

variable "consul_server_ami" {
    description = "AMI to be used when launching new Consul Server."
    default     = "ami-0c6ce4f5f9f0a4548"
}
