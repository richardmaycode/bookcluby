require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  describe "associations" do
    it { should belong_to(:user) } 
    it { should belong_to(:group) }
    it { should belong_to(:book) } 
  end  
end
