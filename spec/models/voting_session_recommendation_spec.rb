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
require 'rails_helper'

RSpec.describe VotingSessionRecommendation, type: :model do
  subject(:voting_session_recommendation) { create(:voting_session_recommendation) } 

  describe "associations" do
    it { should belong_to(:voting_session) } 
    it { should belong_to(:recommendation) } 
    it { should have_many(:votes) }
  end

  describe "#approve_recommendation" do
    it 'sets outcome to approved' do
      voting_session_recommendation.approve_recommendation
      expect(voting_session_recommendation.outcome).to eq "approved"  
    end
    it 'sets its recommendation to approved' do
      voting_session_recommendation.approve_recommendation
      expect(voting_session_recommendation.recommendation.approved).to eq true
    end
    it 'sets its reccomendation to ineligible for future voting' do
      voting_session_recommendation.approve_recommendation
      expect(voting_session_recommendation.recommendation.eligible).to eq false
    end
  end

  describe "#reject_recommendation" do
    it "sets outcome to declined" do
      voting_session_recommendation.reject_recommendation  
      expect(voting_session_recommendation.outcome).to eq "rejected" 
    end
  end
end
