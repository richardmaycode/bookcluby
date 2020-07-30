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

  scope :eligible, -> { where(eligible: true) }
  # validations

  # callback
  after_create :voting_session_assignment
  
  # methods
  def determine_eligibility
    return true unless voting_session_recommendations.count >= group.maximum_voting_sessions

    false
  end

  def active_voting_session
    group.active_voting_session
  end

  def voting_session_assignment
    return unless group.active_voting_session?

    group.voting_sessions.active.each do |avs|
      voting_session_recommendations.create(voting_session_id: avs.id, recommendation_id: id)
    end
  end
end
