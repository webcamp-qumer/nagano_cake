class Genre < ApplicationRecord
  
  #空だと保存することができない
  validates :name, presence: true
end
