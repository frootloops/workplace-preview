FactoryGirl.define do
  factory :promo do
    title "Attention!"
    body "New prices for place 1"
    start_at { Date.yesterday }
    end_at { Date.tomorrow }
  end
end
