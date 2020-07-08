# == Schema Information
#
# Table name: voting_session_recommendations
#
#  id                :bigint           not null, primary key
#  outcome           :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  recommendation_id :bigint
#  voting_session_id :bigint
#
# Indexes
#
#  index_voting_session_recommendations_on_recommendation_id  (recommendation_id)
#  index_voting_session_recommendations_on_voting_session_id  (voting_session_id)
#
FactoryBot.define do
  factory :voting_session_recommendation do
    recommendation
    voting_session
    outcome { "MyString" }
  end
end
