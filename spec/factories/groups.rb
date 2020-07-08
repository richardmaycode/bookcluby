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
FactoryBot.define do
  factory :group do
    name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.words(number: 25) }
    established { "2020-07-03" }
    books_per_month { 1 }
    minimum_planned_months { 3 }
    maximum_voting_sessions { 2 }
    user
  end
end
