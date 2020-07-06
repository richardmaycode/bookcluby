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
