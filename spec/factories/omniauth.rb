FactoryGirl.define do
  factory :twitter_omniauth, class: OmniAuth::AuthHash do
    provider "twitter"
    uid "12345"
    info { { name: "Bob Marley" } }
  end

  factory :facebook_omniauth, class: OmniAuth::AuthHash do
    provider "facebook"
    uid "12345"
    info { { email: "user@facebook.com" } }
  end
end
