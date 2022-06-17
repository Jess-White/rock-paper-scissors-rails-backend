class AddWinsToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :wins, :integer
  end
end
