class Service < ActiveRecord::Base
  validates :name, :profile_cd, presence: true

  as_enum :profile, [:hairdresser, :visagist, :tailor, :tattoo, :piercing]
end
