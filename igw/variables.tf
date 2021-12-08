variable "igw" {

  type = map(object({
    vpc_id = string
    tags = map(string)
  }))

  default = {
    igw = {
      vpc_id = "default_vpc"
      tags = {
       "Environment" : "dev"
      }
    }   
  }
}


