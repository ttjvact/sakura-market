class AddOrderedFlgToCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :ordered_flg, :boolean, default: false, null: false
  end
end
