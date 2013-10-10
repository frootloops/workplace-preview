FactoryGirl.define do
  factory :sample do
    association :master
    association :service
    factory :sample_with_file do
      file { fixture_file_upload(Rails.root.join('spec', 'images', 'photo.jpg'), 'image/jpeg') }
    end
  end
end
