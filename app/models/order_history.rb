class OrderHistory < ApplicationRecord
  belongs_to :customer
  belongs_to :order
  
  #空だと保存することができない
  
 enum status: {"製作不可": 0,"製作待ち": 1,"製作中": 2,"製作完了": 3} #製造ステータス
end
