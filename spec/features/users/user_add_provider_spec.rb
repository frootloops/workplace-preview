require 'spec_helper'

feature "User" do

  scenario "can add provider" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = build(:facebook_omniauth)
    user = create :client
    login_as user
    visit user_path(user)
    click_link I18n.t("users.providers.add", provider: :facebook)
    expect(page).to have_content I18n.t("users.providers.destroy", provider: :facebook)
  end

end
