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
end
