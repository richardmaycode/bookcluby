FactoryBot.define do
  factory :recommendation do
    eligible { true }
    approved { false }
    user
    group
    book
  end
end
