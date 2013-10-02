require 'spec_helper'

feature "Admin" do
  scenario "show cities" do
    create(:city, name: "Moscow")
    login_as create(:admin)
    visit cities_path
    expect(page).to have_content "Moscow"
  end
end
