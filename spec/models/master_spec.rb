require 'spec_helper'

describe Master do

  describe ".all" do
    it "return only masters" do
      user = create(:user)
      master = create(:master)
      expect(Master.all).to eq [master]
    end
  end

end
