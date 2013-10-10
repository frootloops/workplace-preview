require 'spec_helper'

shared_examples "show promos" do
  let(:promo) { create :promo, title: "Attention" }

  before do
    promo and visit root_path
    click_link I18n.t("views.menu.promos")
  end

  it "should see promos page" do
    expect(page).to have_content "Attention"
  end

  it "should see promo page" do
    click_link "Attention"
    expect(page).to have_content "Attention"
  end
end
