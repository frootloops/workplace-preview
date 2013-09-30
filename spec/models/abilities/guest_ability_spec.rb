require 'spec_helper'
require 'cancan/matchers'

describe GuestAbility do
  subject { AbilityFactory.build create(:guest) }
end
