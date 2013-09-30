require 'spec_helper'

feature "User" do
  let(:user) { create(:client, password: "secret42") }
  scenario "can sign in" do
    visit root_path
    click_link I18n.t("devise.sign_in")
    fill_in "user_email", with: user.email
    fill_in "user_password", with: "secret42"
    click_button "Sign in"
    expect(page).to have_content user.email
  end
end
