class ChangeCloumnsNotnullAddAddresses < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :customer_id, :integer, null: false
    change_column :addresses, :postcode, :string, null: false
    change_column :addresses, :address, :string, null: false
    change_column :addresses, :name, :string, null: false
  end
end
