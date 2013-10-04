require 'spec_helper'

describe Event do
  let(:sections) { { master_class: 0, workshop: 1, lecture: 2, exhibition: 3, performance: 4 } }
  it { should validate_presence_of(:section_cd) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:scheduled_at) }

  describe ".sections" do
    it { expect(Event.sections).to eql(sections) }
  end

  it { should have_many(:event_users).dependent(:destroy) }
  it { should have_many(:users).through(:event_users) }

end
