variable "redissubgrp" {
  description = "Redis Subnet Group"
  type = map(object({
    name = string
    description = string
    subnet_ids = list(string)
  }))

  default = {
    redissubgrp = {
      name = "default name"
      description = "default_desc"
      subnet_ids = ["def sub"]
    }
  }
}
