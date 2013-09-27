require 'spec_helper'

describe Country do
  it { should have_many(:cities).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
