require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  subject(:recommendation) { create(:recommendation) } 

  describe "associations" do
    it { should belong_to(:user) } 
    it { should belong_to(:group) }
    it { should belong_to(:book) } 
    it { should have_many(:voting_session_recommendations) }
  end    


  describe "#determine_eligibility" do
    it 'returns true if maximum attempts havent been reached' do
      expect(recommendation.determine_eligibility).to eq true
    end

    it 'returns false if maximum attempts have been reached' do
      excessive_voted_recommendation = create(:excessive_voted_recommendation)
      expect(excessive_voted_recommendation.determine_eligibility).to eq false
    end
  end
end
