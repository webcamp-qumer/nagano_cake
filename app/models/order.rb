class Order < ApplicationRecord
  has_many :order_histories, dependent: :destroy

  #空だと保存することができない
  validates :name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :postage, presence: true
  validates :total_price, presence: true

  enum pay_method: {"クレジットカード": 0, "銀行振込": 1}
  enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3,"発送済み": 4} #注文ステータス
end
