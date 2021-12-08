variable "rta" {
  description = "Route Table Association"
  type = map(object({
    subnet_id = string
    gateway_id = string
    route_table_id = string
  }))
}