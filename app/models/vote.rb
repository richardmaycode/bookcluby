class Vote < ApplicationRecord
  belongs_to :voting_session
  belongs_to :voting_session_recommendation
  has_one :recommendation, through: :voting_session_recommendation
end
