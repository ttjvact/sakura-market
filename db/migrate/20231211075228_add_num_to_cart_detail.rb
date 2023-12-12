class AddNumToCartDetail < ActiveRecord::Migration[7.1]
  def change
    add_column :cart_details, :num, :integer, null:false, default:0
  end
end
