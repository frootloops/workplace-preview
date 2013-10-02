require 'spec_helper'

feature "Admin" do
  before do
    create :country, name: "Russia"
    login_as create(:admin)
    visit cities_path
    click_link I18n.t("views.city.controls.new")
  end

  context "with valid attributes" do
    scenario "add city" do
      fill_in "city_name", with: "Moscow"
      select "Russia", from: "city_country_id"
      click_button I18n.t("helpers.submit.country.create")
      expect(page).to have_content "Moscow"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "city_name", with: " "
      select "Russia", from: "city_country_id"
      click_button I18n.t("helpers.submit.city.create")
      expect(page).to have_content I18n.t("errors.messages.blank")
    end
  end
end
