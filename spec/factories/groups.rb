FactoryBot.define do
  factory :group do
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.word(number: 25) }
    established { "2020-07-03" }
    user
  end
end
