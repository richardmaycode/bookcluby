FactoryBot.define do
  factory :group do
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.word(number: 25) }
    established { "2020-07-03" }
    books_per_month { 1 }
    minimum_planned_months { 3 }
    maximum_voting_sessions { 2 }
    user
  end
end
