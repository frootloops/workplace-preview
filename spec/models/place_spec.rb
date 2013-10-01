require 'spec_helper'

describe Place do
  it { should belong_to(:city) }
  it { should belong_to(:owner) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:area) }
  it { should validate_presence_of(:opening_hours) }
  it { should validate_presence_of(:status_cd) }
  
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:owner) }
end
