class Place < ActiveRecord::Base
  validates :name, :address, :area, :opening_hours, :status_cd, :city, :owner, 
             presence: true

  belongs_to :city
  belongs_to :owner, class_name: :User
end
