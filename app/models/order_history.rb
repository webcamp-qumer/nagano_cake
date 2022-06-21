class OrderHistory < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  
  #空だと保存することができない

  validates :name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :price_non_tax, presence: true
  validates :total_price, presence: true
  validates :amount, presence: true
  validates :status, presence: true

  
 enum status: {"製作不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3} #製造ステータス
end
