# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation_timestamp do
    association :reservation, factory: :reservation
    timestamp "2013-10-08 12:53:32"
  end
end
