require 'spec_helper'

feature "Admin" do
  scenario "can sign in" do
    login_as create(:admin)
    visit admin_root_path
    expect(current_path).to eql(admin_root_path)
  end
end
