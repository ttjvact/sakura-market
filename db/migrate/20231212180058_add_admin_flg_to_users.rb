class AddAdminFlgToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :admin_flg, :boolean, default: false, null: false
  end
end
