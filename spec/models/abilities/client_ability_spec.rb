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

  context Event do
    it { should be_able_to(:show, Event) }
    it { should_not be_able_to(:create, Event) }
    it { should_not be_able_to(:edit, Event) }
    it { should_not be_able_to(:destroy, Event) }
  end

  context EventUser do
    it { should be_able_to(:index, EventUser) }
    it { should be_able_to(:create, EventUser) }
    it { should be_able_to(:destroy, build(:event_user, user: client)) }
    it { should_not be_able_to(:destroy, build(:event_user)) }
  end

  context Master do
    let(:master) { create :master }
    subject { AbilityFactory.build master }
    it { should be_able_to(:read, Master) }
    context "for own master" do
      it { should be_able_to(:edit, master) }
      it { should be_able_to(:update, master) }
    end
    context "for other master" do
      it { should_not be_able_to(:edit, build(:master)) }
      it { should_not be_able_to(:update, build(:master)) }
    end
  end

  context Reservation do
    it { should be_able_to(:crud, create(:reservation, master: client)) }
    it { should_not be_able_to(:crud, create(:reservation)) }
  end
end
