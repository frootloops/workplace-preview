FactoryGirl.define do
  factory :master do
    sequence(:email) {|n| "user#{n}@example.com" }
    gender :male
    password "secret42"
    ignore do
      service "Best haircut"
    end
    after(:create) do |master, evaluator|
      create(:user_service, user: master, service: create(:service, name: evaluator.service))
    end
  end
end
