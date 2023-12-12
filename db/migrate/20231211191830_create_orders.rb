class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true, default: 1
      t.integer :shipping_fee
      t.integer :cash_fee
      t.integer :subtotal
      t.integer :total
      t.integer :total_tax
      t.date :delivery_date
      t.string :delivery_time

      t.timestamps
    end
  end
end
