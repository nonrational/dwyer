class AddPublicFlagToBandName < ActiveRecord::Migration
  def up
    add_column :band_names, :public, :boolean, :default => true
  end

  def down
    remove_column :band_names, :public, :boolean
  end
end
