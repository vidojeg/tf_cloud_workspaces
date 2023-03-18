# TERRAFORM CLOUD ORGANIZATION MANAGEMENT

## REQUIREMENTS

- Manually create Main organization
- Add Management repo inside workspace
- Create TF API USER TOKEN => https://app.terraform.io/app/settings/tokens
- Create GITHUB PAT TOKEN => https://github.com/settings/tokens

## PROVIDERS

| Name | Version |
|------|---------|
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.42.0 |

## MODULES

| Name | Source | Version |
|------|--------|---------|
| <a name="module_organization"></a> [organization](#module\_organization) | ./modules/org | n/a |

## INPUTS

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_oauth_token"></a> [oauth\_token](#input\_oauth\_token) | n/a | `any` | n/a | yes |
| <a name="input_tfe_org"></a> [tfe\_org](#input\_tfe\_org) | n/a | <pre>map(object({<br>    email            = string<br>    workspaces       = map(any)<br>    global_variables = map(any)<br>    vcs              = map(any)<br>  }))</pre> | n/a | yes |
| <a name="input_tfe_token"></a> [tfe\_token](#input\_tfe\_token) | n/a | `any` | n/a | yes |
