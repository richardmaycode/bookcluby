require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { create(:group) }

  describe "associations" do
    it { should belong_to(:user) } 
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:established) }
    # it { should validate_uniqueness_of(:name) }
  end
end
