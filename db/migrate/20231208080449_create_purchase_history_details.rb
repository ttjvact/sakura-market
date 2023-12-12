class CreatePurchaseHistoryDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_history_details do |t|
      t.references :purchasehistory, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
