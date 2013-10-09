require 'spec_helper'

shared_examples "show masters" do
  let(:master) { create :user, master: true }

  before do
    master and visit root_path
    click_link I18n.t("views.menu.masters")
  end

  it "should see masters page" do
    expect(page).to have_content master.email
  end

  it "should see masters page" do
    click_link master.email
    expect(page).to have_content master.email
  end
end
