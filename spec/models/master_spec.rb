require 'spec_helper'

describe Master do

  it { should have_many(:samples).dependent(:destroy) }

  describe ".all" do
    it "return only masters" do
      user = create(:user)
      master = create(:master)
      expect(Master.all).to eq [master]
    end
  end

end
