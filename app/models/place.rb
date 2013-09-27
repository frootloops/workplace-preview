class Place < ActiveRecord::Base
  validates :name, :address, :area, :opening_hours, :status_cd, presence: true

  belongs_to :city
end
