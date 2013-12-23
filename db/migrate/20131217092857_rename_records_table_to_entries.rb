class RenameRecordsTableToEntries < ActiveRecord::Migration
  def change
    rename_table :records, :entries
  end
end
