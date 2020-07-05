FactoryBot.define do
  factory :recommendation do
    eligible { true }
    approved { false }
    user
    group
    book
    factory :excessive_voted_recommendation do
      transient do
        voting_count { 5 }
      end

      after(:create) do |recommendation, evaluator|
        create_list(:voting_session_recommendation, evaluator.voting_count, recommendation: recommendation)
      end
    end
  end
end
