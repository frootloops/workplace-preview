require 'spec_helper'

feature "Admin" do
  let(:country) { create :country, name: "Russia" }

  before do
    login_as create(:admin)
    visit edit_country_path(country)
  end

  context "with valid attributes" do
    scenario "update country" do
      fill_in "country_name", with: "New name"
      click_button I18n.t("helpers.submit.country.update")
      expect(page).to have_content "New name"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "country_name", with: " "
      click_button I18n.t("helpers.submit.country.update")
      expect(page).to have_content I18n.t("errors.messages.blank")
    end
  end


end
