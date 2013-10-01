require 'spec_helper'

feature "Client" do
  let(:client) { create(:client) }
  let(:visitor) { create(:client) }
  let(:place) { create :place, owner: client }

  scenario "should destroy his place" do
    place and login_as(client)
    visit places_path
    click_link I18n.t("views.places.controls.destroy")
    expect(page).to_not have_content place.name
  end

  scenario "should not destroy another place" do
    place and login_as(visitor)
    visit places_path
    click_link I18n.t("views.places.controls.destroy")
    expect(page).to have_content I18n.t("access.denied")
  end
end
