variable  "mediaconvert" {
  description = "queue1"
  type = map(object({
    name = string
    description = string
    pricing_plan = string
    reservation_plan_settings = object({
      commitment = string
      renewal_type = string
      reserved_slots = number
    })
    status = string
    tags = map(string)
  }))
}
