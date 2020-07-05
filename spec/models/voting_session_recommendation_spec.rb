require 'rails_helper'

RSpec.describe VotingSessionRecommendation, type: :model do
  describe "associations" do
    it { should belong_to(:voting_session) } 
    it { should belong_to(:recommendation) } 
  end
  
end
