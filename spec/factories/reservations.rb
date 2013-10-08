FactoryGirl.define do
  factory :reservation do
    association :workstation, factory: :workstation
    association :master, factory: :client
  end
end
