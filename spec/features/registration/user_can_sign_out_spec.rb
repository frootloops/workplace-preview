require 'spec_helper'

feature "User" do

  scenario "can sign out" do
    login_as(create(:user))
    visit root_path
    click_link I18n.t("devise.sign_out")
    expect(page).to have_content I18n.t("devise.sign_in")
  end

end
