class Item < ApplicationRecord
  has_one_attached :image #画像を使うことを宣言
end
