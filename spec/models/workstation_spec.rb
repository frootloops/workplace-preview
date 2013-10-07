require 'spec_helper'

describe Workstation do
  it { should belong_to(:place) }
  it { should belong_to(:service) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:place) }
  it { should validate_presence_of(:service) }

end
