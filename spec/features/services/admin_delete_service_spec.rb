require 'spec_helper'

feature "Admin" do
  scenario "delete service" do
    create(:service, name: "New Look")
    login_as create(:admin)
    visit services_path
    click_link I18n.t("views.service.controls.destroy")
    expect(page).to_not have_content "New Look"
  end
end
