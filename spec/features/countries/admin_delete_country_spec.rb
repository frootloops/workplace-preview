require 'spec_helper'

feature "Admin" do

  scenario "delete country" do
    create(:country, name: "Russia")
    login_as create(:admin)
    visit countries_path
    click_link I18n.t("views.country.controls.destroy")
    expect(page).to_not have_content "Russia"
  end

end
