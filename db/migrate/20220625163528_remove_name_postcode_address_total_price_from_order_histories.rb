class RemoveNamePostcodeAddressTotalPriceFromOrderHistories < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_histories, :name, :string
    remove_column :order_histories, :postcode, :string
    remove_column :order_histories, :address, :string
    remove_column :order_histories, :total_price, :integer
  end
end
