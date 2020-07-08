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
class Recommendation < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :group
  belongs_to :book
  has_many :voting_session_recommendations

  # validations

  # methods
  def determine_eligibility
    return true unless voting_session_recommendations.count >= group.maximum_voting_sessions
    false
  end
end
