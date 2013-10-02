require 'spec_helper'

feature "Admin" do
  let(:service) { create :service, name: "New Look" }

  before do
    login_as create(:admin)
    visit edit_service_path(service)
  end

  context "with valid attributes" do
    scenario "update service" do
      fill_in "service_name", with: "Hip Look"
      click_button I18n.t("helpers.submit.service.update")
      expect(page).to have_content "Hip Look"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "service_name", with: ""
      click_button I18n.t("helpers.submit.service.update")
      expect(page).to have_content I18n.t("errors.messages.blank")
    end
  end
end
