require 'spec_helper'

feature "User" do

  scenario "can sign up" do
    visit root_path
    click_link I18n.t("devise.sign_in")
    click_link "Sign up"
    fill_in "user_email", with: "new_user@example.com"
    fill_in "user_password", with: "1111111111"
    fill_in "user_password_confirmation", with: "1111111111"
    click_button "Sign up"
    expect(page).to have_content "new_user@example.com"
  end

end
