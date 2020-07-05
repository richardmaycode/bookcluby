FactoryBot.define do
  factory :voting_session do
    group
    status { 1 }
    maximum_books_per_person { 2 }
    maximum_books_to_plan { 5 }
    recommendation_lead_days { 2 }
    recommendation_deadline { "2020-07-04" }
    voting_date { "2020-07-04" }
    completion_date { "2020-07-04" }
  end
end
