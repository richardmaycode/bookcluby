# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  author      :string
#  book_cover  :string
#  description :text
#  genre       :string
#  isbn        :string
#  pages       :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Book < ApplicationRecord
  attr_accessor :group_ids
  # associations
  belongs_to :user
  has_many :recommendations
  # validations
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :pages, presence: true
  validates :description, presence: true
  validates_numericality_of :pages, :allow_nil => false, :greater_than => 49, :less_than => 2001
end
