class AddUniqueIndexToCartDetail < ActiveRecord::Migration[7.1]
  def change
    add_index :cart_details, [:cart_id, :item_id], unique: true
  end
end
