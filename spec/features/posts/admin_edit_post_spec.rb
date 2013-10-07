require 'spec_helper'

feature "Admin" do

  background do
    login_as create(:admin)
    create(:post)
    visit about_path
    click_link I18n.t("views.posts.controls.edit")
  end

  context "with valid attributes" do
    scenario "update post" do
      fill_in "post_title", with: "Updated title"
      click_button I18n.t("helpers.submit.post.update")
      expect(page).to have_content "Updated title"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "post_title", with: " "
      click_button I18n.t("helpers.submit.post.update")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end
end
