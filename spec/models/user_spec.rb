require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe "associations" do
    it { should have_many(:books) } 
    it { should have_many(:recommendations) }
    it { should have_many(:memberships) }
    it { should have_many(:groups).through(:memberships) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
