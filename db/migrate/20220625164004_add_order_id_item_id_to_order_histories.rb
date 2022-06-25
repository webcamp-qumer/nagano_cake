class AddOrderIdItemIdToOrderHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :order_histories, :order_id, :integer, null: false
    add_column :order_histories, :item_id, :integer, null: false
  end
end
