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
