FactoryBot.define do
  factory :vote do
    voting_session { nil }
    voting_session_recommendation { nil }
    outcome { false }
  end
end
