require 'spec_helper'

feature "Admin" do

  background do
    create(:event)
    login_as create(:admin)
    visit events_path
    click_link I18n.t("views.event.controls.edit")
  end

  context "with valid attributes" do
    scenario "update event" do
      fill_in "event_body", with: "Updated body"
      click_button I18n.t("helpers.submit.event.update")
      expect(page).to have_content "Updated body"
    end
  end

  context "with invalid attributes" do
    scenario "see errors" do
      fill_in "event_body", with: " "
      click_button I18n.t("helpers.submit.event.update")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end

end
