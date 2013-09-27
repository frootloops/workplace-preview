require 'spec_helper'

describe City do
  it { should belong_to(:country) }
  it { should have_many(:places) }
  it { should validate_presence_of(:name) }
end
