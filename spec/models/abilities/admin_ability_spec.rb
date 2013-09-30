require 'spec_helper'
require 'cancan/matchers'

describe AdminAbility do
  subject { AbilityFactory.build create(:admin) }
  it { should be_able_to(:manage, :all) }
end
