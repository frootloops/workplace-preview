require 'spec_helper'

describe Reservation do
  let(:reservation) { create :reservation }
  let(:workstation) { create :workstation }
  let(:some_date) {"1970-01-01 10:00"  }

  it { should belong_to(:master) }
  it { should belong_to(:workstation) }
  it { should have_many(:timestamps).dependent(:destroy) }
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

    it "return false unavailable date" do
      bob_reservation = create :reservation, workstation: workstation
      bob_reservation.book some_date
      
      alex_reservation = create :reservation, workstation: workstation
      expect(alex_reservation.bookable? some_date).to be_false
    end

    it "return true for different workstations" do
      bob_reservation = create :reservation, workstation: create(:workstation)
      bob_reservation.book some_date

      alex_reservation = create :reservation, workstation: create(:workstation)
      expect(alex_reservation.bookable? some_date).to be_true
    end
  end

  describe "#purchase" do
    it "from draft to paid" do
      expect { reservation.purchase! }.to change { reservation.paid? }
    end
  end

  describe "#complete" do
    let(:reservation) { create :reservation, state: :paid }
    it "from paid to completed" do
      expect { reservation.complete! }.to change { reservation.completed? }
    end
  end

  describe "#rollback" do
    let(:reservation) { create :reservation, state: :paid }
    it "from paid to draft" do
      expect { reservation.rollback! }.to change { reservation.draft? }
    end
  end
end
