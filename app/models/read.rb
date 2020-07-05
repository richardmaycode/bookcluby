class Read < ApplicationRecord
  # associations
  belongs_to :group
  belongs_to :recommendation
  has_one :recommender, through: :recommendation, source: :user
  has_one :book, through: :recommendation, source: :book

  # validations
  validates :scheduled, presence: true
end
