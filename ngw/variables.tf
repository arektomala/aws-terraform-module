variable "ngw" {
  description = "ngw"
  type = map(object({
    allocation_id = string
    subnet_id = string
    tags = map(string)
  }))

  default = {
    ngw = {
      allocation_id = "default_eip"
      subnet_id = "default_subnet"
      tags = {
        "Environment" : "dev"
      }
    }
  }
}
