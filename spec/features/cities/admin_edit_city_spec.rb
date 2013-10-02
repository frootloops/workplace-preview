require 'spec_helper'

feature "Admin" do
  let(:city) { create :city, name: "Moscow" }

  before do
    login_as create(:admin)
    visit edit_city_path(city)
  end

  context "with valid attributes" do
    scenario "update city" do
      fill_in "city_name", with: "New name"
      click_button I18n.t("helpers.submit.city.update")
      expect(page).to have_content "New name"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "city_name", with: " "
      click_button I18n.t("helpers.submit.city.update")
      expect(page).to have_content I18n.t("errors.messages.blank")
    end
  end
end
