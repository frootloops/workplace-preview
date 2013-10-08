class ReservationTimestamp < ActiveRecord::Base
  validates :timestamp, presence: true
  belongs_to :reservation
end
