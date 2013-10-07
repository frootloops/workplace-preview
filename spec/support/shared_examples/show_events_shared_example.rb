require 'spec_helper'

shared_examples "show events page" do
  it "should see all events" do
    event = create :event
    visit root_path
    click_link I18n.t("views.menu.events")
    expect(page).to have_content event.body
  end
end
