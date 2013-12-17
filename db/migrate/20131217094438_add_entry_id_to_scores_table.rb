class AddEntryIdToScoresTable < ActiveRecord::Migration
  def change
    rename_column :scores, :record_id, :entry_id
  end
end
