FactoryGirl.define do
  factory :workstation do
    association :place
    association :service
    name "First workplace"
  end
end
