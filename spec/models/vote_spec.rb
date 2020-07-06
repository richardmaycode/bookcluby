require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "associations" do
    it { should belong_to(:voting_session) } 
    it { should belong_to(:voting_session_recommendation) }
    it { should have_one(:recommendation).through(:voting_session_recommendation) } 
  end  
end
