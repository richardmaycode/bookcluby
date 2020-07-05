class User < ApplicationRecord
  # associations
  has_many :books
  has_many :recommendations
  has_many :memberships
  has_many :groups, through: :memberships
  # validations
  validates_presence_of :name
  validates_presence_of :email
end
