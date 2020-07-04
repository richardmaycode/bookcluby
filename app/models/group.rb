class Group < ApplicationRecord
  # associations
  belongs_to :user
  has_many :recommendations
  # validations
  validates :name, presence: true, uniqueness: true
  validates :established, presence: true
end
