require 'spec_helper'

feature "Admin" do
  let(:workstation) { create :workstation }

  background do
    login_as create(:admin)
    visit edit_workstation_path(workstation)
  end

  context "with valid attributes" do
    scenario "update workstation" do
      fill_in "workstation_name", with: "Updated name"
      click_button I18n.t("helpers.submit.workstation.update")
      expect(page).to have_content "Updated name"
    end
  end

  context "with invalid attributes" do
    scenario "see errors" do
      fill_in "workstation_name", with: " "
      click_button I18n.t("helpers.submit.workstation.update")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end
end
