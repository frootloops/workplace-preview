require 'spec_helper'

shared_examples "show posts" do
  it "should see all posts" do
    post = create :post
    visit about_path
    click_link I18n.t("views.menu.about")
    expect(page).to have_content post.body
  end
end
