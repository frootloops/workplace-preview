require 'spec_helper'

feature "Client" do

  scenario "join event" do
    create(:event)
    login_as create(:client)
    visit events_path
    click_link I18n.t("views.event.join")
    expect(page).to have_content I18n.t("views.event.leave")
  end

end
