require 'spec_helper'

describe Promo do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:start_at) }
  it { should validate_presence_of(:end_at) }

  describe ".scopes" do
    let(:actual_promo) { create :promo, start_at: Date.yesterday, end_at: Date.tomorrow }
    let(:old_promo) { create :promo, start_at: Date.yesterday, end_at: Date.yesterday }
    describe ".actual" do
      it "return only actual promos" do
        actual_promo and old_promo
        expect(Promo.actual).to eq [actual_promo]
      end

      it "return only actual promos" do
        actual_promo and old_promo
        expect(Promo.archived).to eq [old_promo]
      end
    end
  end
end
