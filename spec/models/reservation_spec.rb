require 'spec_helper'

describe Reservation do
  let(:reservation) { create :reservation }
  let(:some_date) {"1970-01-01 10:00"  }

  it { should belong_to(:master) }
  it { should belong_to(:workstation) }
  it { should have_many(:timestamps) }
  it { should validate_presence_of(:state) }

  describe "#book" do
    it "should create timestamp" do
      expect { create(:reservation).book(some_date) }.to change { ReservationTimestamp.count }.by(1)
    end

    it "should not create timestamp" do
      reservation.book some_date
      expect { reservation.book(some_date) }.to_not change { reservation.timestamps.count }
    end
  end

  describe "#bookable?" do
    it "return true for available date" do
      expect(reservation.bookable? some_date).to be_true
    end

    it " return false unavailable date" do
      bob_reservation = create :reservation
      bob_reservation.book some_date
      
      alex_reservation = create :reservation
      expect(alex_reservation.bookable? some_date).to be_false
    end    
  end
end
