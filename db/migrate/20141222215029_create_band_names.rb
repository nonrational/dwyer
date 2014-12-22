class CreateBandNames < ActiveRecord::Migration
  def change
    create_table :band_names do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
