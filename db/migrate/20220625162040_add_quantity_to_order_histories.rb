class AddQuantityToOrderHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :order_histories, :quantity, :integer, null: false
  end
end