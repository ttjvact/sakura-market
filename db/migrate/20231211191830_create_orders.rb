class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.string :payment
      t.integer :shipping_cost
      t.integer :subtotal
      t.integer :commission
      t.integer :total

      t.timestamps
    end
  end
end
