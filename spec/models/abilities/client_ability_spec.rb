require 'spec_helper'
require 'cancan/matchers'

describe ClientAbility do
  subject { AbilityFactory.build create(:client) }
end
