require 'spec_helper'

feature "Admin" do

  background do
    login_as create(:admin)
    visit about_path
    click_link I18n.t("views.posts.controls.new")
  end

  context "with valid attributes" do
    scenario "add new post" do
      fill_in "post_title", with: "New post"
      fill_in "post_body", with: "post body"
      click_button I18n.t("helpers.submit.post.create")
      expect(page).to have_content "New post"
    end
  end

  context "with invalid attributes" do
    scenario "show errors" do
      fill_in "post_title", with: " "
      click_button I18n.t("helpers.submit.post.create")
      expect(page).to have_content(I18n.t("errors.messages.blank"))
    end
  end
end
