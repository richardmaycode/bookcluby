# == Schema Information
#
# Table name: groups
#
#  id                      :bigint           not null, primary key
#  books_per_month         :integer
#  description             :text
#  established             :date
#  invite_code             :string
#  maximum_voting_sessions :integer
#  minimum_planned_months  :integer
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Group, type: :model do
  subject(:group) { create(:group) }

  describe "associations" do
    it { should belong_to(:user) } 
    it { should have_many(:recommendations) } 
    it { should have_many(:memberships) } 
    it { should have_many(:members).through(:memberships).source(:user) }
    it { should have_many(:reads) }
    it { should have_many(:voting_sessions) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:established) }
    it { should validate_presence_of(:books_per_month) }
    it { should validate_presence_of(:minimum_planned_months) }
    it { should validate_presence_of(:maximum_voting_sessions) }
    it 'validates presences of invite_code' do
      group.invite_code = nil
      expect(group).not_to be_valid
    end
    it { should validate_numericality_of(:books_per_month).is_greater_than(0).is_less_than(5) }
    it { should validate_numericality_of(:minimum_planned_months).is_greater_than(0).is_less_than(13) }
    it { should validate_numericality_of(:maximum_voting_sessions).is_greater_than(0).is_less_than(100) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "#set_invite_code" do
    it "creates and sets an invite code" do
      old_code = group.invite_code
      group.set_invite_code
      expect(group.invite_code).not_to eq old_code  
    end
  end

  describe "#member" do
    it "returns true if user is a group member" do
      membership = create(:membership)
      expect(membership.group.member?(membership.user)).to eq true
    end
    it 'returns false if user is not a group member' do
      user = create(:user)
      expect(group.member?(user)).to eq false
    end
  end
  describe "#admin" do
    it 'returns true if user is admin member' do
      membership = create(:admin_membership)
      expect(membership.group.admin?(membership.user)).to eq true
    end
    it 'returns false if user is not admin member' do
      user = create(:user)
      expect(group.admin?(user)).to eq false
    end
  end
  describe "#set_default_admin" do
    it 'assigns creator as an admin member' do
      new_group = create(:group)
      new_group.set_default_admin
      expect(new_group.user).to eq new_group.memberships.last.user
    end
  end
  describe '#active_voting_session?' do
    it 'returns true if there active voting_session' do
      voting_session = create(:active_voting_session)
      group_w_active_session = voting_session.group
      expect(group_w_active_session.active_voting_session?).to eq true
    end
    it 'returns false if no active votings_session' do
      expect(group.active_voting_session?).to eq false
    end
  end
end
