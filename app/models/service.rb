class Service < ActiveRecord::Base
  validates :name, :profile_cd, presence: true

  has_many :workstations, dependent: :destroy

  as_enum :profile, [:hairdresser, :visagist, :tailor, :tattoo, :piercing]
end
