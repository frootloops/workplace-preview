require 'spec_helper'

feature "Admin" do
  let(:first_profile) { Service.profiles_for_select[0][0] }
  before do
    login_as create(:admin)
    visit services_path
    click_link I18n.t("views.service.controls.new")
  end

  context "with valid attributes" do
    scenario "add service" do
      fill_in "service_name", with: "New Look"
      click_button I18n.t("helpers.submit.service.create")
      select first_profile, from: "service_profile"
      click_button I18n.t("helpers.submit.service.create")
      expect(page).to have_content "New Look"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "service_name", with: " "
      select first_profile, from: "service_profile"
      click_button I18n.t("helpers.submit.service.create")
      expect(page).to have_content I18n.t("errors.messages.blank")
    end
  end
end
