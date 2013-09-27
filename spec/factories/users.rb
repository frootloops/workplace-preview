FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    username "bob"
    name "Bob Marley"
    gender_cd 1
    phone "77-77-77"
    password "1111111111"
  end
end
