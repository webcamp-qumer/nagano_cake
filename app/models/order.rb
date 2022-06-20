class Order < ApplicationRecord
  has_many :order_histories, dependent: :destroy
end
