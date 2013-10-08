require 'spec_helper'

describe Reservation do
  it { should belong_to(:master) }
  it { should belong_to(:workstation) }
  it { should have_many(:timestamps) }
  
  it { should validate_presence_of(:state) }
end
