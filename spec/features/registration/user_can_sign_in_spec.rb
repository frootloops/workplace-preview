require 'spec_helper'

feature "User" do

  scenario "can sign in" do
    user = create(:user, email: "old_user@example.com", password: "1111111111")
    visit root_path
    click_link I18n.t("devise.sign_in")
    fill_in "user_email", with: "old_user@example.com"
    fill_in "user_password", with: "1111111111"
    click_button "Sign in"
    expect(page).to have_content "old_user@example.com"
  end

end
