require 'spec_helper'

feature "Admin" do
  let(:place) { create :place }
  let(:service) { create :service }

  background do
    login_as create(:admin)
    visit workstations_path
  end

  context "with valid attributes" do
    scenario "create workstation" do
      place and service
      click_link I18n.t("views.workstation.controls.new")
      fill_in "workstation_name", with: "First workstation"
      select place.name, from: "workstation_place_id"
      select service.name, from: "workstation_service_id"
      click_button I18n.t("helpers.submit.workstation.create")
      expect(page).to have_content "First workstation"
    end
  end

  context "with invalid attributes" do
    scenario "see errors" do
      click_link I18n.t("views.workstation.controls.new")
      fill_in "workstation_name", with: " "
      click_button I18n.t("helpers.submit.workstation.create")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end
end
