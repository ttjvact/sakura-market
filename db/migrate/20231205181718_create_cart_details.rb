class CreateCartDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_details do |t|
      t.references :item, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.timestamps
    end
  end
end
