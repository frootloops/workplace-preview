require 'spec_helper'

feature "Client" do
  let(:client) { create(:client) }
  let(:tmp_place) { build :place }
  let(:city) { create :city }

  background do
    city and login_as(client)
    visit places_path
    click_link I18n.t("views.places.controls.new")
  end

  scenario "create new place" do
    within("#new_place") do
      fill_in 'place_name', with: tmp_place.name
      fill_in 'place_address', with: tmp_place.address
      fill_in 'place_area', with: tmp_place.area
      fill_in 'place_opening_hours', with: tmp_place.opening_hours

      select city.name, from: "place_city_id"
    end

    click_button I18n.t("helpers.submit.place.create")
    expect(page).to have_content(tmp_place.name)
  end

  scenario "try create new place" do
    within("#new_place") do
      fill_in 'place_name', with: tmp_place.name
    end

    click_button I18n.t("helpers.submit.place.create")
    expect(page).to have_content(I18n.t("errors.messages.blank"))
  end
end
