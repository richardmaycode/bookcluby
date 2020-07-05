class CreateVotingSessionRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :voting_session_recommendations do |t|
      t.belongs_to :voting_session
      t.belongs_to :recommendation
      t.string :outcome

      t.timestamps
    end
  end
end
