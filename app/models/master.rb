class Master < User
  default_scope -> { joins(:user_services) }

  has_many :samples, dependent: :destroy
end
