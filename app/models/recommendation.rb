class Recommendation < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :group
  belongs_to :book
  has_many :voting_session_recommendations

  # validations

  # methods
  def determine_eligibility
    return true unless voting_session_recommendations.count >= group.maximum_voting_sessions
    false
  end
end
