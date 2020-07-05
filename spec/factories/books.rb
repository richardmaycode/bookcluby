FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Book.genre }
    pages { 50 }
    description { Faker::Lorem.words(number: 60) }
    user
  end
end
