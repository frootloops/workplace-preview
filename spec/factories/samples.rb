FactoryGirl.define do
  factory :sample do
    association :master
    association :service
    file "MyString"
  end
end
