package applications

import data.global
import input.method

# Inherit from global
allow = global.allow

# Get all apps is always allowed
allow {
  input.method == "GET"
  input.path = ["api", "apps"]
}

# Get details about an app is always allowed
allow {
  input.method == "GET"
  input.path = ["api", "apps", _]
}

# Get comments of an app is always allowed
allow {
  input.method == "GET"
  input.path = ["api", "apps", _, "comments"]
}

# Get app logo is allways allowed
allow {
  input.method == "GET"
  input.path = ["api", "apps", _, "logo"]
}

# Path: GET /api/apps/:app_id
# Only user can view his apps
allow {
    some user, app, userId, appId

    input.method == "PUT"
    input.path = ["api", "users", userId, "apps", appId]

    global.hasToken
    data.pg.users[user].name = global.token.payload.sub
    data.pg.app[app].user_id = user.id
    app.id = appId
    user.id = userId
}
