class User < ApplicationRecord
  # associations

  # validations
  validates_presence_of :name
  validates_presence_of :email
end
