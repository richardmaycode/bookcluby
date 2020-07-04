class User < ApplicationRecord
  # associations
  has_many :books
  # validations
  validates_presence_of :name
  validates_presence_of :email
end
