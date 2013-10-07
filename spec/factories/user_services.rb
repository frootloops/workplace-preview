FactoryGirl.define do
  factory :user_service do
    association :user
    association :service
  end
end
