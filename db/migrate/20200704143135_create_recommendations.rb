class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.boolean :eligible, default: true
      t.boolean :approved, default: false
      
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true
      t.belongs_to :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
