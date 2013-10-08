require 'spec_helper'

describe ReservationTimestamp do
  it { should belong_to(:reservation) }
  
  it { should validate_presence_of(:timestamp) }
end
