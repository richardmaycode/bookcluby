require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  subject(:recommendation) { create(:recommendation) } 

  describe "associations" do
    it { should belong_to(:user) } 
    it { should belong_to(:group) }
    it { should belong_to(:book) } 
    it { should have_many(:voting_session_recommendations) }
  end    
end
