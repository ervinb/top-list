class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :record_id
      t.integer :score

      t.timestamps
    end
  end
end
