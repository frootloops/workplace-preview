require 'spec_helper'
require 'cancan/matchers'

describe GuestAbility do
  subject { AbilityFactory.build create(:guest) }

  it { should be_able_to(:index, Place) }
end
