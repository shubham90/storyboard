User.seed do |s|
  s.id    = 1
  s.name = "john"
  s.email = "jon@example.com"
  s.password = "qwerty123"
  s.password_confirmation = "qwerty123"
end

User.seed do |s|
  s.id    = 2
  s.name = "admin"
  s.email = "admin@example.com"
  s.password = "qwerty123"
  s.password_confirmation = "qwerty123"
end
