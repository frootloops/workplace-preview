require 'spec_helper'

feature "Admin" do

  background do
    login_as create(:admin)
    visit promos_path
    click_link I18n.t("views.promo.controls.new")
  end

  context "with valid attributes" do
    scenario "add new promo" do
      fill_in "promo_title", with: "Attention"
      fill_in "promo_body", with: "New price for .."
      select "2017", from: "promo_end_at_1i"
      click_button I18n.t("helpers.submit.promo.create")
      expect(page).to have_content "Attention"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "promo_title", with: " "
      click_button I18n.t("helpers.submit.promo.create")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end
end
