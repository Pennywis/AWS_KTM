data "tfe_slug" "this" {
  source_path = "policies/test-enforce-policies"
}

data "tfe_policy_set" "this" {
  name         = "test-enforce-policies"
  organization = "husqvarna"
}

import {
  to = tfe_policy_set.this
  id = data.tfe_policy_set.this.id
}

resource "tfe_policy_set" "this" {
  name                = "test-enforce-policies"
  description         = ""
  organization        = "husqvarna"
  kind                = "sentinel"
  agent_enabled       = true
  policy_tool_version = "latest"
  overridable         = true

  // reference the tfe_slug data source.
  slug = data.tfe_slug.this
}
