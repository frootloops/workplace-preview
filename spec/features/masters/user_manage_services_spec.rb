require 'spec_helper'

feature "User" do
  let(:user) { create(:client) }
  let(:service) { create :service }

  before do
    service and login_as user
  end

  scenario "add service" do
    visit edit_user_registration_path
    check "user_service_ids_"
    click_button I18n.t("helpers.submit.user.update")
    visit edit_user_registration_path
    expect(find("#user_service_ids_")).to be_checked
  end

  scenario "remove service" do
    create(:user_service, user: user, service: service)
    visit edit_user_registration_path
    uncheck "user_service_ids_"
    click_button I18n.t("helpers.submit.user.update")
    visit edit_user_registration_path
    expect(find("#user_service_ids_")).to_not be_checked
  end
end
