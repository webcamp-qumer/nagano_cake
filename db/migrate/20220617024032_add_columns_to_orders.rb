class AddColumnsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :postcode, :string
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :postage, :integer
    add_column :orders, :total_price, :integer
    add_column :orders, :pay_method, :integer, null: false, default: 0
    add_column :orders, :status, :integer, null: false, default: 0
  end
end
