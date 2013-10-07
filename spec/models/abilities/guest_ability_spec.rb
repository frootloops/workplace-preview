require 'spec_helper'
require 'cancan/matchers'

describe GuestAbility do
  subject { AbilityFactory.build create(:guest) }

  it { should be_able_to(:index, Place) }

  context Workstation do
    it { should be_able_to(:read, Workstation) }
    it { should_not be_able_to(:create, Workstation) }
    it { should_not be_able_to(:edit, Workstation) }
    it { should_not be_able_to(:update, Workstation) }
    it { should_not be_able_to(:destroy, Workstation) }
  end
end
