require 'rails_helper'

RSpec.describe Read, type: :model do
  describe "associations" do
    it { should belong_to(:group) } 
    it { should belong_to(:recommendation) } 
    it { should have_one(:recommender).through(:recommendation).source(:user) }
    it { should have_one(:book).through(:recommendation).source(:book) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:scheduled) }
  end
  
end
