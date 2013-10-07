require 'spec_helper'

feature "Admin" do
  background { login_as create(:admin) }
  it_behaves_like "show posts"
end
