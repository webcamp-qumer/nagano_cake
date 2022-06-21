class ChangeCloumnsNotnullAddItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :name, :string, null: false
    change_column :items, :message, :text, null: false
    change_column :items, :price_non_tax, :integer, null: false
  end
end
