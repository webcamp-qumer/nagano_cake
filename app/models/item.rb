class Item < ApplicationRecord
  has_one_attached :image #画像を使うことを宣言
  
  #空だと保存することができない
  validates :name, presence: true
  validates :message, presence: true
  validates :price_non_tax, presence: true
end
