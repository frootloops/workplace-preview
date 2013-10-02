require 'spec_helper'

feature "Admin" do

  before do
    login_as create(:admin)
    visit countries_path
    click_link I18n.t("views.country.controls.new")
  end

  context "with valid attributes" do
    scenario "add country" do
      fill_in "country_name", with: "Russia"
      click_button I18n.t("helpers.submit.country.create")
      expect(page).to have_content "Russia"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "country_name", with: " "
      click_button I18n.t("helpers.submit.country.create")
      expect(page).to have_content I18n.t("errors.messages.blank")
    end
  end


end
