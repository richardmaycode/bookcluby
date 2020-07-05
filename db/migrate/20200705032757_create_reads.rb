class CreateReads < ActiveRecord::Migration[6.0]
  def change
    create_table :reads do |t|
      t.belongs_to :group, null: false, foreign_key: true
      t.belongs_to :recommendation, null: false, foreign_key: true
      t.date :scheduled

      t.timestamps
    end
  end
end
