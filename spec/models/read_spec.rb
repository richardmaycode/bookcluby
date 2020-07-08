# == Schema Information
#
# Table name: reads
#
#  id                :bigint           not null, primary key
#  scheduled         :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  group_id          :bigint           not null
#  recommendation_id :bigint           not null
#
# Indexes
#
#  index_reads_on_group_id           (group_id)
#  index_reads_on_recommendation_id  (recommendation_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (recommendation_id => recommendations.id)
#
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
