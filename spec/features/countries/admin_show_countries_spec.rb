require 'spec_helper'

feature "Admin" do

  scenario "show countries" do
    create(:country, name: "Russia")
    login_as create(:admin)
    visit countries_path
    expect(page).to have_content "Russia"
  end

end
