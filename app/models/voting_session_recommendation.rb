class VotingSessionRecommendation < ApplicationRecord
  belongs_to :voting_session
  belongs_to :recommendation
end
