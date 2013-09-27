require 'spec_helper'

describe User do
  it { should have_many(:providers).dependent(:destroy) }

  describe ".roles" do
    it { expect(User.roles).to eql({ admin: 1, client: 0 }) }
  end

  describe "Default values" do
    let(:user) { User.new }
    it { expect(user.role).to eql(:client) }
  end
end
