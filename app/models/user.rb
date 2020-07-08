# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
