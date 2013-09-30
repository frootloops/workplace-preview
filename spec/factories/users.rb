FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    username "bob"
    name "Bob Marley"
    gender :male
    phone "77-77-77"
    password "secret42"
    role :client

    factory :admin do
      role :admin
    end

    factory :client
    factory :guest
  end
end
