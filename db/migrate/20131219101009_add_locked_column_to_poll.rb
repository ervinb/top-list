class AddLockedColumnToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :locked, :boolean, :default => false
  end
end
