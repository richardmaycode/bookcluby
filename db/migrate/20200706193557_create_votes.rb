class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.boolean :outcome

      t.belongs_to :voting_session, null: false, foreign_key: true
      t.belongs_to :voting_session_recommendation, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
