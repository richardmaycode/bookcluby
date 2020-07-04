class User < ApplicationRecord
  # associations
  has_many :books
  has_many :recommendations
  # validations
  validates_presence_of :name
  validates_presence_of :email
end
