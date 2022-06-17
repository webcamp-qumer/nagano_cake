class AddColumnsToOrderShows < ActiveRecord::Migration[6.1]
  def change
    add_column :order_shows, :price, :integer
    add_column :order_shows, :amount, :integer
    add_column :order_shows, :making_status, :integer, null: false, default: 0
  end
end
