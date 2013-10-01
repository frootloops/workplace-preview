require 'spec_helper'
require 'cancan/matchers'

describe ClientAbility do
  let(:client) { create :client }
  subject { AbilityFactory.build client }

  context Place do
    let(:my_place) { create :place, owner: client }
    let(:other_place) { create :place }

    it { should be_able_to(:index, Place) }

    context "as owner" do
      it { should be_able_to(:crud, my_place) }
    end

    context "as visitor" do
      it { should_not be_able_to(:crud, other_place) }
    end
  end

  context User do
    it { should be_able_to(:show, client) }
    it { should_not be_able_to(:show, build(:user)) }
  end

end
