require 'spec_helper'

describe UserService do
  it { should belong_to(:user) }
  it { should belong_to(:service) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:service) }
end
