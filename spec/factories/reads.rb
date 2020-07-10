# == Schema Information
#
# Table name: reads
#
#  id                :bigint           not null, primary key
#  is_current        :boolean          default(FALSE)
#  scheduled         :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  group_id          :bigint           not null
#  recommendation_id :bigint           not null
#
# Indexes
#
#  index_reads_on_group_id           (group_id)
#  index_reads_on_recommendation_id  (recommendation_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (recommendation_id => recommendations.id)
#
FactoryBot.define do
  factory :read do
    group
    recommendation
    scheduled { "2020-07-04" }
  end
end
