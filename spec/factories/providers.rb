FactoryGirl.define do
  factory :provider do
    association :user
    name "facebook"
    uid "123456"
  end
end
