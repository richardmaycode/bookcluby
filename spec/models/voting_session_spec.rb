# == Schema Information
#
# Table name: voting_sessions
#
#  id                       :bigint           not null, primary key
#  completion_date          :date
#  maximum_books_per_person :integer
#  maximum_books_to_plan    :integer
#  recommendation_deadline  :date
#  recommendation_lead_days :integer
#  status                   :integer
#  voting_date              :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  group_id                 :bigint           not null
#
# Indexes
#
#  index_voting_sessions_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
require 'rails_helper'

RSpec.describe VotingSession, type: :model do
  describe "relationships" do
    it { should belong_to(:group) }
    it { should have_many(:voting_session_recommendations) }
    it { should have_many(:recommendations).through(:voting_session_recommendations) }
    it { should have_many(:books).through(:recommendations) } 
    it { should have_many(:recommenders).through(:recommendations).source(:user) }
    it { should have_many(:votes) }
  end
  
  describe "validations" do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:maximum_books_per_person) }
    it { should validate_presence_of(:recommendation_lead_days) }
    it { should validate_presence_of(:maximum_books_to_plan) }
    it { should validate_presence_of(:completion_date) }
    it { should validate_presence_of(:voting_date) }
    it { should validate_presence_of(:recommendation_deadline) }

    it { should validate_numericality_of(:maximum_books_per_person).is_greater_than(0).is_less_than(11) }
    it { should validate_numericality_of(:recommendation_lead_days).is_greater_than(0).is_less_than(11) }
    it { should validate_numericality_of(:maximum_books_to_plan).is_greater_than(0).is_less_than(13) }
  end
  
end
