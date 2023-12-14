class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true, default: 1
      t.integer :shipping_fee, null: false
      t.integer :cash_fee, null: false
      t.integer :subtotal, null: false
      t.integer :total, null: false
      t.integer :total_tax, null: false
      t.date :delivery_date, null: false
      t.string :delivery_time, null: false

      t.timestamps
    end
  end
end
