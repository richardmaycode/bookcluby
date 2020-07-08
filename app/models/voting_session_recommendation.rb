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
class VotingSessionRecommendation < ApplicationRecord
  belongs_to :voting_session
  belongs_to :recommendation
  has_many :votes

  def approve_recommendation
    update_column(:outcome, "approved")
    recommendation.update(approved: true, eligible: false)
  end

  def reject_recommendation
    update_column(:outcome, "rejected")
  end
end
