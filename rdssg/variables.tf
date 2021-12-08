variable "rdssg" {
  description = "RDS security groups"
  type = map(object({
    name = string
    name_prefix = string
    description = string
    subnet_ids = list(string)
    tags = map(string)
  }))
}