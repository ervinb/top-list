class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.integer :poll_id
      t.integer :score_id

      t.timestamps
    end
  end
end
