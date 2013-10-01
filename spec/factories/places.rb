FactoryGirl.define do
  factory :place do
    association :city, factory: :city
    association :owner, factory: :client
    address "18 Perevedenovskiy Lane"
    name "WorkPlace #1"
    area 350
    opening_hours "8.00 - 24.00"
    status_cd 1
  end
end
