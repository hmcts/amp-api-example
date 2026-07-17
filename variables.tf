variable "api_mgmt_rg" {
  type        = string
  description = "Resource group name of the target APIM instance."
}

variable "api_mgmt_name" {
  type        = string
  description = "Name of the target APIM instance."
}

variable "product" {
  description = "Product configuration to create in APIM."
  type = object({
    name                          = string
    subscription_required         = optional(bool, true)
    subscriptions_limit           = optional(number, 20)
    approval_required             = optional(bool, true)
    published                     = optional(bool, true)
    product_access_control_groups = optional(list(string), [])
    product_policy                = optional(string, "")
  })
}

variable "apis" {
  description = "Map of APIs to create in APIM. API details are sourced from the referenced OpenAPI spec file."
  type = map(object({
    openapi_spec_path     = string
    service_url           = string
    name                  = optional(string)
    display_name          = optional(string)
    path                  = optional(string)
    revision              = optional(string, "1")
    protocols             = optional(list(string), ["https"])
    subscription_required = optional(bool, true)
    api_type              = optional(string, "http")
  }))
}
