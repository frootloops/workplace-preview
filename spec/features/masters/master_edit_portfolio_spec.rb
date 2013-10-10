require 'spec_helper'

feature "Master", js: true do
  let(:master) { create :master, service: "Best haircut" }

  background do
    login_as master
    visit master_path(master)
    click_link I18n.t("views.masters.controls.edit")
    click_link I18n.t("views.masters.add_sample")
  end

  context "with valid attributes" do
    scenario "update portfolio" do
      choose "Best haircut"
      click_button I18n.t("helpers.submit.master.update")
      expect(page).to have_content "Best haircut"
    end
  end

  context "with invalid attributes" do
    scenario "see errors" do
      attach_file I18n.t("activerecord.attributes.sample.file"),
                  Rails.root.join('spec', 'images', 'photo.jpg')
      click_button I18n.t("helpers.submit.master.update")
      expect(page).to have_content I18n.t("errors.messages.blank")
    end
  end

end
