api_mgmt_rg   = "core-infra-sbox-rg"
api_mgmt_name = "core-apim-sbox"

apim_product = {
  name                          = "example-product"
  subscription_required         = true
  subscriptions_limit           = 20
  approval_required             = false
  published                     = true
  product_access_control_groups = ["developers", "administrators"]
  product_policy                = ""
}

apis = {
  example-api = {
    openapi_spec_path = "./specs/example-api.yaml"
    service_url       = "https://example-api-sbox.internal"
    # name, path and display_name can be omitted and will default from the OpenAPI spec.
    revision = "1"
  }
}
