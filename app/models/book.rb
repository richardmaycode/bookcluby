class Book < ApplicationRecord
  # associations

  # validations
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :pages, presence: true
  validates :description, presence: true
  validates_numericality_of :pages, :allow_nil => false, :greater_than => 49, :less_than => 2001
end
