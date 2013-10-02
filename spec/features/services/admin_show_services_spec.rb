require 'spec_helper'

feature "Admin" do
  scenario "show services" do
    create(:service, name: "New Look")
    login_as create(:admin)
    visit services_path
    expect(page).to have_content "New Look"
  end
end
