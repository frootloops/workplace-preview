require 'spec_helper'

feature "User" do
  let(:user) { create(:client) }

  before do
    login_as user
    visit user_path(user)
    click_link I18n.t("devise.edit_registration")
  end

  scenario "update name" do
    fill_in "user_name", with: "Bob"
    click_button I18n.t("helpers.submit.user.update")
    click_link user.email
    expect(page).to have_content "Bob"
  end

  scenario "update email with already existing in app" do
    another_user = create(:user)
    fill_in "user_email", with: another_user.email
    click_button I18n.t("helpers.submit.user.update")
    expect(page).to have_content I18n.t("activerecord.errors.models.user.attributes.email.taken")
  end
end
