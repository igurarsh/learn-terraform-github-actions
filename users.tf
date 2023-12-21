# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

provider "googleworkspace" {
  
  customer_id = "C015shyxa"
  impersonated_user_email = "singh@igurarsh.com"

}

locals {
  users = csvdecode(file("${path.module}/users.csv"))
}

resource "googleworkspace_user" "users" {
  for_each = { for user in local.users : user.new_email => user }

  primary_email = each.value.email
  password      = each.value.password
  hash_function = each.value.password_hash_function

  name {
    family_name = each.value.last_name
    given_name  = each.value.first_name
  }
}
