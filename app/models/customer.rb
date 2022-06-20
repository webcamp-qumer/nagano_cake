class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :order_histories, dependent: :destroy
  has_many :addresses, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
