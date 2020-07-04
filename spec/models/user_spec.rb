require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "associations" do
    it { should have_many(:books) } 
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
