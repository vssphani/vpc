variable "AWS_REGION" {
  default = "us-west-2"
}

variable "rules" {
    type=list(object({
        from_port = number
        to_port = number
        protocol = string
        cidr_block = string
        description = string
    }))

    default = [{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        description = "allow ssh connectivity"
    },
     {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_block = "0.0.0.0/0"
        description = "allow web server connectivity"
     }]
}