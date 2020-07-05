class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :book
  
  has_many :voting_session_recommendations
end
