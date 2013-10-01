require 'spec_helper'

describe "Client visit place page" do
  before { login_as create(:client) }
  it_behaves_like "visit place page"
end
