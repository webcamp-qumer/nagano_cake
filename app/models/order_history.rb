class OrderHistory < ApplicationRecord
  belongs_to :item
  belongs_to :order

  #空だと保存することができない

  validates :price_non_tax, presence: true
  validates :quantity, presence: true
  validates :status, presence: true

  enum status: {"製作不可": "制作不可","製作待ち": 1,"製作中": 2,"製作完了": 3} #製造ステータス
end
