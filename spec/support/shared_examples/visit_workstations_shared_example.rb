require 'spec_helper'

shared_examples "visit workstations page" do
  it "should see all workstations" do
    workstation = create :workstation, name: "First workstation"
    visit root_path
    click_link I18n.t("views.menu.workstation")
    expect(page).to have_content "First workstation"
  end
end
