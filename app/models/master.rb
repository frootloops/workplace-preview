class Master < User
  default_scope -> { joins(:user_services) }
end
