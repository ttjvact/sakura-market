class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :postal_code
      t.string :prefecture
      t.string :city
      t.string :town
      t.string :building_name

      t.timestamps
    end
  end
end
