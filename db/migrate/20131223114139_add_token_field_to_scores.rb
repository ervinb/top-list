class AddTokenFieldToScores < ActiveRecord::Migration
  def change
    add_column :scores, :token, :string
  end
end
