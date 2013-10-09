FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    username "bob"
    name "Bob Marley"
    gender :male
    phone "77-77-77"
    password "secret42"
    role :client

    factory :admin do
      role :admin
    end
    factory :client
    factory :guest

    ignore do
      facebook false
      twitter false
      master false
    end

    after(:create) do |user, evaluator|
      user.providers.create(name: 'facebook', uid: '12345') if evaluator.facebook
      user.providers.create(name: 'twitter', uid: '12345') if evaluator.twitter
      create(:user_service, user: user) if evaluator.master
    end

  end
end
