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

  context Provider do
    it { should be_able_to(:create, Provider) }
    it { should be_able_to(:destroy, build(:provider, user: client)) }
    it { should_not be_able_to(:destroy, build(:provider)) }
  end

  context Workstation do
    it { should be_able_to(:read, Workstation) }
    it { should_not be_able_to(:create, Workstation) }
    it { should_not be_able_to(:edit, Workstation) }
    it { should_not be_able_to(:update, Workstation) }
    it { should_not be_able_to(:destroy, Workstation) }
  end

end
