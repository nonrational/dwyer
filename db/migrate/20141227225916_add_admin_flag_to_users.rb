class AddAdminFlagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    User.find(1).update(admin: true)
  end
end
