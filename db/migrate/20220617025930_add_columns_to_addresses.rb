class AddColumnsToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :postcode, :string
    add_column :addresses, :address, :string
    add_column :addresses, :name, :string
  end
end
