require 'spec_helper'

describe Place do
  it { should belong_to(:city) }
  it { should belong_to(:owner) }
  it { should have_many(:workstations).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:area) }
  it { should validate_presence_of(:opening_hours) }
  it { should validate_presence_of(:status_cd) }

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:owner) }

  describe "default values" do
    subject { Place.new }
    it { expect(subject.status).to eql(:draft) }
  end

  describe ".statuses" do
    it { expect(Place.statuses).to eql({ draft: 0, open: 2, preview: 1 }) }
  end
end
