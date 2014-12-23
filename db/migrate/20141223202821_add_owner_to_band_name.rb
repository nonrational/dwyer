class AddOwnerToBandName < ActiveRecord::Migration
  def change
    add_column :band_names, :user_id, :integer, null: false
  end
end
