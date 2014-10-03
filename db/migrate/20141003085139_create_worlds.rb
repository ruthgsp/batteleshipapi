class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.integer :game_set_id
      t.integer :turn
      t.string :player
      t.integer :x_coordinate
      t.integer :y_coordinate
      t.string :state

      t.timestamps
    end
  end
end
