require 'spec_helper'

feature "User" do

  scenario "can delete provider" do
    user = create :client, facebook: true
    login_as user
    visit user_path(user)
    click_link I18n.t("users.providers.destroy", provider: :facebook)
    expect(page).to have_content I18n.t("users.providers.add", provider: :facebook)
  end

end
