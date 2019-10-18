package api

import data.global

# Inherit from global
allow = global.allow

allow {
  input.method == "POST"
  input.path = ["api", "login"]
}