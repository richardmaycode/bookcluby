class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.date :established
      t.integer :books_per_month
      t.integer :minimum_planned_months
      t.integer :maximum_voting_sessions
      t.string :invite_code

      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
