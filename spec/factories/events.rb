FactoryGirl.define do
  factory :event do
    section :master_class
    body "Description of event"
    scheduled_at "2013-10-04 12:18:26"
    poster { fixture_file_upload(Rails.root.join('spec', 'images', 'photo.jpg'), 'image/jpeg') }
  end
end
