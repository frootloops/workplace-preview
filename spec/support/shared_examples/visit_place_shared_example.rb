require 'spec_helper'

shared_examples "visit place page" do
  it "should see all places" do
    place = create :place
    visit root_path
    click_link I18n.t("views.menu.place")
    expect(page).to have_content place.name
  end
end
