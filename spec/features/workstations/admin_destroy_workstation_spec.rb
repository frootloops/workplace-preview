require 'spec_helper'

feature "Admin" do

  scenario "destroy workstation" do
    workstation = create(:workstation)
    login_as create(:admin)
    visit workstations_path
    click_link I18n.t("views.workstation.controls.destroy")
    expect(page).to_not have_content workstation.name
  end

end
