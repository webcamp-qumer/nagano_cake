class ChangeCloumnsNotnullAddCartItems < ActiveRecord::Migration[6.1]
  def change
    change_column :cart_items, :amount, :integer, null: false
  end
end
