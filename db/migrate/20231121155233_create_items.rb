class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :product_name
      t.text :product_image
      t.integer :price
      t.string :discription
      t.boolean :hidden
      t.integer :priority

      t.timestamps
    end
  end
end
