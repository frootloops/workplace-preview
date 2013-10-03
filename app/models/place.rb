class Place < ActiveRecord::Base
  validates :name, :address, :area, :opening_hours, :status_cd, :city, :owner,
             presence: true

  belongs_to :city
  belongs_to :owner, class_name: :User
  has_many :workstations, dependent: :destroy

  as_enum :status, [:draft, :preview, :open]
end
