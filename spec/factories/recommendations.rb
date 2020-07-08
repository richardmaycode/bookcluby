# == Schema Information
#
# Table name: recommendations
#
#  id         :bigint           not null, primary key
#  approved   :boolean          default(FALSE)
#  eligible   :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  group_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_recommendations_on_book_id   (book_id)
#  index_recommendations_on_group_id  (group_id)
#  index_recommendations_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :recommendation do
    eligible { true }
    approved { false }
    user
    group
    book
    factory :excessive_voted_recommendation do
      transient do
        voting_count { 5 }
      end

      after(:create) do |recommendation, evaluator|
        create_list(:voting_session_recommendation, evaluator.voting_count, recommendation: recommendation)
      end
    end
  end
end
