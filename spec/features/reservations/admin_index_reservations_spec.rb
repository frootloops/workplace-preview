require 'spec_helper'

feature "Admin" do
  scenario "view list reservations" do
    create :reservation, comment: "Call me back"
    login_as create(:admin)
    visit reservations_path
    expect(page).to have_content "Call me back"
  end
end
