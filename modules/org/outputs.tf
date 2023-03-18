output "oauth_token_id" {
  value = { for k, v in tfe_oauth_client.vcs_provider : k => v.oauth_token_id }
}
