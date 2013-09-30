require 'spec_helper'

feature "User" do

  before do
    OmniAuth.config.test_mode = true
  end

  scenario "sign in with facebook" do
    create(:user, email: "new_user@example.com", facebook: true)
    OmniAuth.config.mock_auth[:facebook] = build(:facebook_omniauth)
    visit root_path
    click_link I18n.t("devise.sign_in")
    click_link "Sign in with Facebook"
    expect(page).to have_content "new_user@example.com"
  end

  scenario "sign in with twitter" do
    create(:user, email: "new_user@example.com", twitter: true)
    OmniAuth.config.mock_auth[:twitter] = build(:twitter_omniauth)
    visit root_path
    click_link I18n.t("devise.sign_in")
    click_link "Sign in with Twitter"
    expect(page).to have_content "new_user@example.com"
  end

end
