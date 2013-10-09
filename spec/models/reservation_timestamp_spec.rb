require 'spec_helper'

describe ReservationTimestamp do
  it { should belong_to(:reservation) }
  it { should validate_presence_of(:timestamp) }

  describe "#timestamp=" do
    it "should set datetime with 00 minutes" do
      bday = "1991-02-11 12:00"
      expect(ReservationTimestamp.new(timestamp: bday).timestamp).to \
        eql(Time.parse(bday))
    end

    it "should not set datetime with 25 minutes" do
      expect { ReservationTimestamp.new(timestamp: "1991-02-11 12:25") }.to raise_error
    end
  end
end
