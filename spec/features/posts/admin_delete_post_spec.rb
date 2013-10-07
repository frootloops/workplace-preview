require 'spec_helper'

feature "Admin" do
  scenario "delete post" do
    login_as create(:admin)
    create(:post, title: "First post")
    visit about_path
    click_link I18n.t("views.posts.controls.destroy")
    expect(page).to_not have_content "First post"
  end
end
