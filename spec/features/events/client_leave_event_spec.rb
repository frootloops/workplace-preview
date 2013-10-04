require 'spec_helper'

feature "Client" do

  scenario "leave event" do
    event = create(:event)
    client = create(:client)
    create(:event_user, event: event, user: client)
    login_as client
    visit events_path
    click_link I18n.t("views.event.leave")
    expect(page).to have_content I18n.t("views.event.join")
  end

end
