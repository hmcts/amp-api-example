module "product" {
  source = "git::https://github.com/hmcts/cnp-module-api-mgmt-product.git?ref=master"

  api_mgmt_rg                   = var.api_mgmt_rg
  api_mgmt_name                 = var.api_mgmt_name
  name                          = var.product.name
  subscription_required         = var.product.subscription_required
  subscriptions_limit           = var.product.subscriptions_limit
  approval_required             = var.product.approval_required
  published                     = var.product.published
  product_access_control_groups = var.product.product_access_control_groups
  product_policy                = var.product.product_policy
}
