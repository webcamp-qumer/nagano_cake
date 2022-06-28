class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|

      t.integer  :price_non_tax,  null: false
      t.integer  :status,         null: false, default: 0

      t.timestamps
    end
  end
end
