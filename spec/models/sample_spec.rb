require 'spec_helper'

describe Sample do
  it { should belong_to(:master) }
  it { should belong_to(:service) }

  it { should validate_presence_of(:master) }
  it { should validate_presence_of(:service) }
end
