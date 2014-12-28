class AddAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    User.find(1).update(admin: true)
  end
end
