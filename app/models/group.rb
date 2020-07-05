class Group < ApplicationRecord
  # associations
  belongs_to :user
  has_many :recommendations
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  # validations
  validates :name, presence: true, uniqueness: true
  validates :established, presence: true
  validates :books_per_month, presence: true
  validates :minimum_planned_months, presence: true
  validates :maximum_voting_sessions, presence: true
  validates_numericality_of :books_per_month, :allow_nil => false, :greater_than => 0, :less_than => 5
  validates_numericality_of :minimum_planned_months, :allow_nil => false, :greater_than => 0, :less_than => 13
  validates_numericality_of :maximum_voting_sessions, :allow_nil => false, :greater_than => 0, :less_than => 100    
end
