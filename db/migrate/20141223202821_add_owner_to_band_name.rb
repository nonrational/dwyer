class AddOwnerToBandName < ActiveRecord::Migration
  def up
    add_column :band_names, :user_id, :integer
    change_column_null :band_names, :user_id, false
  end
  def down
    remove_column :band_names, :user_id, :integer
  end
end
