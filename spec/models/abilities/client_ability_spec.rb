require 'spec_helper'
require 'cancan/matchers'

describe ClientAbility do
  subject { AbilityFactory.build create(:client) }

  context Place do
    let(:my_place) { create :place, owner: subject.user }
    let(:other_place) { create :place }

    it { should be_able_to(:index, Place) }

    context "as owner" do
      it { should be_able_to(:crud, my_place) }
    end

    context "as visitor" do
      it { should_not be_able_to(:crud, other_place) }
    end
  end
end
