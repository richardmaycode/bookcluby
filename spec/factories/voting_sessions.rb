# == Schema Information
#
# Table name: voting_sessions
#
#  id                       :bigint           not null, primary key
#  completion_date          :date
#  maximum_books_per_person :integer
#  maximum_books_to_plan    :integer
#  recommendation_deadline  :date
#  recommendation_lead_days :integer
#  status                   :integer
#  voting_date              :date
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  group_id                 :bigint           not null
#
# Indexes
#
#  index_voting_sessions_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
FactoryBot.define do
  factory :voting_session do
    group
    status { 2 }
    maximum_books_per_person { 2 }
    maximum_books_to_plan { 5 }
    recommendation_lead_days { 2 }
    recommendation_deadline { "2020-07-04" }
    voting_date { "2020-07-04" }
    completion_date { "2020-07-04" }
    factory :active_voting_session do
      status { 0 }
    end
  end
end
