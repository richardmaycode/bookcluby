# == Schema Information
#
# Table name: groups
#
#  id                      :bigint           not null, primary key
#  books_per_month         :integer
#  description             :text
#  established             :date
#  invite_code             :string
#  maximum_voting_sessions :integer
#  minimum_planned_months  :integer
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :bigint           not null
#
# Indexes
#
#  index_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Group < ApplicationRecord
  # associations
  belongs_to :user
  has_many :recommendations
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :reads
  has_many :voting_sessions

  # validations
  validates :name, presence: true, uniqueness: true
  validates :established, presence: true
  validates :books_per_month, presence: true
  validates :minimum_planned_months, presence: true
  validates :maximum_voting_sessions, presence: true
  validates :invite_code, presence: true
  validates_numericality_of :books_per_month, allow_nil: false, greater_than: 0, less_than: 5
  validates_numericality_of :minimum_planned_months, allow_nil: false, greater_than: 0, less_than: 13
  validates_numericality_of :maximum_voting_sessions, allow_nil: false, greater_than: 0, less_than: 100

  # callbacks
  before_validation :set_invite_code, on: :create
  after_save :set_default_admin

  # methods
  def set_invite_code
    code = Faker::Hipster.word + Faker::Number.number(digits: 2).to_s
    self.invite_code = code
  end

  def member?(user)
    user.groups.exists?(id)
  end

  def admin?(user)
    return false unless member?(user)

    return true if user.memberships.where(role: 'admin', group_id: id)

    false
  end

  def set_default_admin
    return if user.memberships.exists?(group_id: id, role: 'admin')

    Membership.create(group_id: id, user_id: user_id, role: 'admin')
  end

  def active_voting_session?
    return false unless voting_sessions.exists?(status: 0)

    true
  end
end
