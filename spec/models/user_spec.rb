require 'spec_helper'

describe User do
  it { should have_many(:providers).dependent(:destroy) }
  it { should have_many(:places).dependent(:destroy) }

  describe ".roles" do
    it { expect(User.roles).to eql({ admin: 1, client: 0 }) }
  end

  describe "#guest?" do
    it { expect(build :guest).to be_guest }
    it { expect(create :client).to_not be_guest }
  end

  describe "Default values" do
    let(:user) { User.new }
    it { expect(user.role).to eql(:client) }
  end

  describe "#available_providers" do
    it "return array of available providers" do
      expect(create(:user, facebook: true).available_providers).to eq ["twitter"]
    end
  end
end
