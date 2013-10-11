require 'spec_helper'

feature "Admin" do
  scenario "delete promo" do
    login_as create(:admin)
    visit promo_path(create(:promo, title: "Attention"))
    click_link I18n.t("views.promo.controls.destroy")
    expect(page).to_not have_content "Attention"
  end
end
