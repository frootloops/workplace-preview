require 'spec_helper'

feature "Client" do
  background { login_as create(:client) }
  it_behaves_like "show posts"
end
