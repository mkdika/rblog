FactoryBot.define do
  factory :tag do
    name { Faker::Book.unique.genre }
  end
end