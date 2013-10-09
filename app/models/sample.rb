class Sample < ActiveRecord::Base
  validates :master, :service, presence: true

  belongs_to :master
  belongs_to :service
end
