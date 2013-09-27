class City < ActiveRecord::Base
  validates :name, presence: true

  has_many :places
  belongs_to :country
end
