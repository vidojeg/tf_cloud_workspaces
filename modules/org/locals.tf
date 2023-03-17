locals {
  local_variables = flatten([
    for k, v in var.tfe_organization : [
      for var_key, var_val in v.global_variables : {
        var_key   = var_key
        var_value = var_val
        set_id    = k
      }
    ]
  ])
}
