class Service < ActiveRecord::Base
  validates :name, :profile_cd, presence: true

  has_many :workstations, dependent: :destroy
  has_many :user_services, dependent: :destroy
  has_many :users, through: :user_services

  as_enum :profile, [:hairdresser, :visagist, :tailor, :tattoo, :piercing]
end
