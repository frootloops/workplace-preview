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

  describe ".find_by_user!" do
    it "return not readonly instance" do
      master = create(:master)
      expect(Master.find_by_user!(master.id)).to_not be_readonly
    end
  end

end
