require 'spec_helper'

feature "Client" do
  let(:client) { create(:client) }
  let(:place) { create(:place, owner: client) }

  background do
    place and login_as(client)
    visit places_path
    click_link place.name
  end

  scenario "update existing place" do
    within("#edit_place_#{place.id}") do
      fill_in 'place_name', with: "BestPlace"
    end

    click_button I18n.t("helpers.submit.place.update")
    expect(page).to have_content("BestPlace")
  end

  scenario "update with invalid data" do
    within("#edit_place_#{place.id}") do
      fill_in 'place_name', with: nil
    end

    click_button I18n.t("helpers.submit.place.update")
    expect(page).to have_content(I18n.t("errors.messages.blank"))
  end
end
