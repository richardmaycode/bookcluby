class Group < ApplicationRecord
  # associations
  belongs_to :user
  # validations
  validates :name, presence: true, uniqueness: true
  validates :established, presence: true
end
