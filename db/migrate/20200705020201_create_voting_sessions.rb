class CreateVotingSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :voting_sessions do |t|
      t.belongs_to :group, null: false, foreign_key: true
      t.integer :status
      t.integer :maximum_books_per_person
      t.integer :recommendation_lead_days
      t.integer :maximum_books_to_plan
      t.date :recommedation_deadline
      t.date :voting_date
      t.date :completion_date

      t.timestamps
    end
  end
end
