require 'spec_helper'

feature "Client" do
  scenario "can't sign in" do
    login_as create(:client)
    visit admin_root_path
    expect(current_path).to_not eql(admin_root_path)
  end
end
