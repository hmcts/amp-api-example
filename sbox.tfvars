api_mgmt_rg   = "rg-sps-platform-sbox"
api_mgmt_name = "sps-api-mgmt-sbox"

apim_product = {
  name                          = "example-product"
  subscription_required         = true
  subscriptions_limit           = 20
  approval_required             = false
  published                     = true
  product_access_control_groups = []
  product_policy                = ""
}

apis = {
  example-api = {
    openapi_spec_path = "./specs/example-api.yaml"
    service_url       = "https://example-api-sbox.internal"
    revision          = "1"
  }
}
