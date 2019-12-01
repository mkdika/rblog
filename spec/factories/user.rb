FactoryBot.define do
  factory :user  do
    email { Faker::Internet.unique.email }
    display_name { Faker::Name.name }
    password { 'password' }
    password_confirmation { 'password' }
  end

  trait :locked do
    locked_at { DateTime.now }
  end

  trait :without_display_name do
    display_name { nil }
  end
end