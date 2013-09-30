require 'spec_helper'

describe Ability do
  let(:guest) { build :guest }
  let(:client) { create :client }
  let(:admin) { create :admin }

  describe "#user" do
    let(:ability) { Ability.new client }
    it { expect(ability.user).to be(client) }
  end
end
