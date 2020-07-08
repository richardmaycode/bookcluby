# == Schema Information
#
# Table name: recommendations
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE)
#  eligible   :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  group_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_recommendations_on_book_id   (book_id)
#  index_recommendations_on_group_id  (group_id)
#  index_recommendations_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  subject(:recommendation) { create(:recommendation) } 

  describe "associations" do
    it { should belong_to(:user) } 
    it { should belong_to(:group) }
    it { should belong_to(:book) } 
    it { should have_many(:voting_session_recommendations) }
  end    


  describe "#determine_eligibility" do
    it 'returns true if maximum attempts havent been reached' do
      expect(recommendation.determine_eligibility).to eq true
    end

    it 'returns false if maximum attempts have been reached' do
      excessive_voted_recommendation = create(:excessive_voted_recommendation)
      expect(excessive_voted_recommendation.determine_eligibility).to eq false
    end
  end
end
