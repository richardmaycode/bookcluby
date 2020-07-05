FactoryBot.define do
  factory :voting_session_recommendation do
    recommendation
    voting_session
    outcome { "MyString" }
  end
end
