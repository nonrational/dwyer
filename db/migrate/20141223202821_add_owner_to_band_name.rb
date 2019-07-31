class AddOwnerToBandName < ActiveRecord::Migration[5.0]
  def up
    add_column :band_names, :user_id, :integer
  end
  def down
    remove_column :band_names, :user_id, :integer
  end
end
