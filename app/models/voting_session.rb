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
class VotingSession < ApplicationRecord
  # associations
  belongs_to :group
  has_many :voting_session_recommendations
  has_many :recommendations, through: :voting_session_recommendations
  has_many :books, through: :recommendations
  has_many :recommenders, through: :recommendations, source: :user
  has_many :votes
  # validations
  validates :status, presence: true
  validates :maximum_books_per_person, presence: true
  validates :recommendation_lead_days, presence: true
  validates :maximum_books_to_plan, presence: true
  validates :completion_date, presence: true
  validates :voting_date, presence: true
  validates :recommendation_deadline, presence: true

  validates_numericality_of :maximum_books_per_person, :allow_nil => false, :greater_than => 0, :less_than => 11
  validates_numericality_of :recommendation_lead_days, :allow_nil => false, :greater_than => 0, :less_than => 11
  validates_numericality_of :maximum_books_to_plan, :allow_nil => false, :greater_than => 0, :less_than => 13
end
