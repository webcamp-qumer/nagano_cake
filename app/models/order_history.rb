class OrderHistory < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  
  #空だと保存することができない
  
end
