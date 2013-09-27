FactoryGirl.define do
  factory :city do
    name "Moscow"
    association :country, factory: :country
  end
end
