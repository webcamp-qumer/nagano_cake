class AddCustomerIdToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :customer_id, :string
  end
end
