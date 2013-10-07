require 'spec_helper'

feature "Admin" do

  let(:first_type) { Event.sections_for_select[0][0] }

  background do
    login_as create(:admin)
    visit events_path
    click_link I18n.t("views.event.controls.new")
  end

  context "with valid attributes" do
    scenario "add new event" do
      select first_type, from: "event_section"
      fill_in "event_body", with: "Event body"
      click_button I18n.t("helpers.submit.event.create")
      expect(page).to have_content "Event body"
    end
  end

  context "with invalid attributes" do
    scenario "see errors" do
      fill_in "event_body", with: " "
      click_button I18n.t("helpers.submit.event.create")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end

end
