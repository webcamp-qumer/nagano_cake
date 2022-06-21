class ChangeCloumnsNotnullAddOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :postcode, :string, null: false
    change_column :orders, :address, :string, null: false
    change_column :orders, :name, :string, null: false
    change_column :orders, :postage, :integer, null: false
    change_column :orders, :total_price, :integer, null: false
  end
end
