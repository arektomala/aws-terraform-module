variable "dashboard" {

  type = map(object({
    dashboard_name = string
    dashboard_body = string

  }))
}
