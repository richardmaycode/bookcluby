require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { create(:group) }

  describe "associations" do
    it { should belong_to(:user) } 
    it { should have_many(:recommendations) } 
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:established) }
    it { should validate_presence_of(:books_per_month) }
    it { should validate_presence_of(:minimum_planned_months) }
    it { should validate_presence_of(:maximum_voting_sessions) }
    it { should validate_numericality_of(:books_per_month).is_greater_than(0).is_less_than(5) }
    it { should validate_numericality_of(:minimum_planned_months).is_greater_than(0).is_less_than(13) }
    it { should validate_numericality_of(:maximum_voting_sessions).is_greater_than(0).is_less_than(100) }
    # it { should validate_uniqueness_of(:name) }
  end
end
