class AddInvitesSentFieldToPoll < ActiveRecord::Migration
  def change
    add_column :polls, :invites_sent, :boolean
  end
end
