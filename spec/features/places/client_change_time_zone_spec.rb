require 'spec_helper'

feature "Client" do
  let(:client) { create(:client) }
  let(:place) { create(:place, owner: client) }
  let(:tz) { ActiveSupport::TimeZone.all.first }

  scenario "change time zone" do
    place and login_as(client)
    visit places_path
    click_link place.name

    select tz.to_s, from: "place_time_zone"
    click_button I18n.t("helpers.submit.place.update")

    expect(page).to have_content(tz.name)
  end
end
