class Reservation < ActiveRecord::Base
  validates :state, presence: true

  belongs_to :workstation
  belongs_to :master, class_name: :User
  
  has_many :timestamps, dependent: :destroy, class_name: :ReservationTimestamp

  scope :actual, -> {}

  state_machine initial: :draft do
    state :reserved
    state :paid
    state :completed

    event :reserve do
      transition draft: :reserved
    end

    event :purchase do
      transition reserved: :paid
    end

    event :rollback do
      transition paid: :draft
    end

    event :complete do
      transition paid: :completed
    end
  end

  def book(datetime)
    timestamps.create timestamp: datetime
  end

  def bookable?(datetime)
    actual_reservations = workstation.reservations.actual.pluck(:id)
    ReservationTimestamp.exists?(reservation_id: actual_reservations, timestamp: Time.parse(datetime)).nil?
  end
end
