require 'spec_helper'

describe AbilityFactory do
  let(:guest) { AbilityFactory.build build(:guest) }
  let(:empty) { AbilityFactory.build nil }
  let(:client) { AbilityFactory.build create(:client) }
  let(:admin) { AbilityFactory.build create(:admin) }

  it { expect(guest).to be_a_kind_of(GuestAbility) }
  it { expect(empty).to be_a_kind_of(GuestAbility) }
  it { expect(client).to be_a_kind_of(ClientAbility) }
  it { expect(admin).to be_a_kind_of(AdminAbility) }
end
