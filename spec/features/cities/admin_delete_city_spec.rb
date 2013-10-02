require 'spec_helper'

feature "Admin" do
  scenario "delete city" do
    create(:city, name: "Moscow")
    login_as create(:admin)
    visit cities_path
    click_link I18n.t("views.city.controls.destroy")
    expect(page).to_not have_content "Moscow"
  end
end
