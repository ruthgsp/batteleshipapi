class RenameStateToHitType < ActiveRecord::Migration
  def change
    rename_column :worlds, :state, :hit_type
  end
end
