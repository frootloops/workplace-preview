require 'spec_helper'

feature "User" do
  let(:user) { create(:client, name: "Bob") }

  before do
    login_as user
  end

  scenario "can show his profile" do
    visit root_path
    click_link user.email
    expect(page).to have_content "Bob"
  end

  scenario "can't show other user profile" do
    other_user = create(:client)
    visit user_path(other_user)
    expect(page).to have_content I18n.t("access.denied")
  end
end
