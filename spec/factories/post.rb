FactoryBot.define do
  factory :post do
    fake_title = Faker::Book.unique.title
    title { fake_title }
    content { "## #{fake_title}"}
    release { false }
    category
    user
  end
end