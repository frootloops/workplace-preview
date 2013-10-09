FactoryGirl.define do
  factory :master do
    sequence(:email) {|n| "user#{n}@example.com" }
    gender :male
    password "secret42"
    after(:create) do |master, evaluator|
      create(:user_service, user: master)
    end
  end
end
