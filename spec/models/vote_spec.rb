# == Schema Information
#
# Table name: votes
#
#  id                               :bigint           not null, primary key
#  outcome                          :boolean
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  user_id                          :bigint           not null
#  voting_session_id                :bigint           not null
#  voting_session_recommendation_id :bigint           not null
#
# Indexes
#
#  index_votes_on_user_id                           (user_id)
#  index_votes_on_voting_session_id                 (voting_session_id)
#  index_votes_on_voting_session_recommendation_id  (voting_session_recommendation_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (voting_session_id => voting_sessions.id)
#  fk_rails_...  (voting_session_recommendation_id => voting_session_recommendations.id)
#
require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "associations" do
    it { should belong_to(:voting_session) } 
    it { should belong_to(:voting_session_recommendation) }
    it { should have_one(:recommendation).through(:voting_session_recommendation) } 
  end  
end
