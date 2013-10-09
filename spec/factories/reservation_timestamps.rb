FactoryGirl.define do
  factory :reservation_timestamp do
    association :reservation, factory: :reservation
    timestamp "1991-02-11 11:00"
  end
end
