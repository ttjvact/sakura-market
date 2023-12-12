class PurchaseHistoryDetail < ApplicationRecord
  belongs_to :purchasehistory
  belongs_to :item
end
