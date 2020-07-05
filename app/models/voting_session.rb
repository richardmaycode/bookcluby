class VotingSession < ApplicationRecord
  # associations
  belongs_to :group
  has_many :voting_session_recommendations
  has_many :recommendations, through: :voting_session_recommendations
  has_many :books, through: :recommendations
  has_many :recommenders, through: :recommendations, source: :user
  # validations
  validates :status, presence: true
  validates :maximum_books_per_person, presence: true
  validates :recommendation_lead_days, presence: true
  validates :maximum_books_to_plan, presence: true
  validates :completion_date, presence: true
  validates :voting_date, presence: true
  validates :recommedation_deadline, presence: true

  validates_numericality_of :maximum_books_per_person, :allow_nil => false, :greater_than => 0, :less_than => 11
  validates_numericality_of :recommendation_lead_days, :allow_nil => false, :greater_than => 0, :less_than => 11
  validates_numericality_of :maximum_books_to_plan, :allow_nil => false, :greater_than => 0, :less_than => 13
end
