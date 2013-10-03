class Workstation < ActiveRecord::Base
  validates :name, :place, :service, presence: true

  belongs_to :place
  belongs_to :service
end
