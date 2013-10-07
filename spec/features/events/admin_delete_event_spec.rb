require 'spec_helper'

feature "Admin" do

  scenario "delete event" do
    event = create(:event)
    login_as create(:admin)
    visit events_path
    click_link I18n.t("views.event.controls.destroy")
    expect(page).to_not have_content event.body
  end

end
