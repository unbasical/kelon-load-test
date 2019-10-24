package global

allow = false

# swa_student is always allowed
allow {
    hasToken
    token.payload.sub == "swa_student"
}

hasToken {
    count(input.token) > 7
}

# Helper to get the token payload.
token = {"payload": payload} {
  [_, payload, _] := io.jwt.decode(input.token)
}