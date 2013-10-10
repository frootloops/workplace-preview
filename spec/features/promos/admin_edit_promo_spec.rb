require 'spec_helper'

feature "Admin" do

  background do
    login_as create(:admin)
    visit promo_path(create(:promo))
    click_link I18n.t("views.promo.controls.edit")
  end

  context "with valid attributes" do
    scenario "update promo" do
      fill_in "promo_title", with: "Updated title"
      click_button I18n.t("helpers.submit.promo.update")
      expect(page).to have_content "Updated title"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "promo_title", with: " "
      click_button I18n.t("helpers.submit.promo.update")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end
end
