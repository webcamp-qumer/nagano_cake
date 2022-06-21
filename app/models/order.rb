class Order < ApplicationRecord
  has_many :order_histories, dependent: :destroy
  
  #空だと保存することができない
  validates :name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :postage, presence: true
  validates :total_price, presence: true
end
