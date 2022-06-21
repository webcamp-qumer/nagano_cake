class Item < ApplicationRecord
  has_one_attached :image #画像を使うことを宣言

  belongs_to :genre
  
  #空だと保存することができない
  validates :name, presence: true
  validates :message, presence: true
  validates :price_non_tax, presence: true
  validates :genre_id, presence: true
  
  # 消費税を加えた商品価格
  def price
      (self.price_non_tax * 1.10).round
  end

end
