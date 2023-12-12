class AddNameToAdress < ActiveRecord::Migration[7.1]
  def change
    add_column :addresses, :name, :text
  end
end
