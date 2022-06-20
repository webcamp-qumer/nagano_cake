class CreateOrderHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :order_histories do |t|
      t.string   :name,           null: false
      t.string   :postcode,       null: false
      t.string   :address,        null: false
      t.integer  :total_price,    null: false
      t.integer  :price_non_tax,  null: false
      t.integer  :amount,         null: false
      t.integer  :status,         null: false
      #t.datetime :created_at,     null: false

      t.timestamps
    end
  end
end
