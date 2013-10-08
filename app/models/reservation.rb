class Reservation < ActiveRecord::Base
  validates :state, presence: true

  belongs_to :workstation
  belongs_to :master, class_name: :User

  state_machine initial: :draft do

  end
end
