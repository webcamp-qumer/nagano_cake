class AddColumnsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :name, :string
    add_column :items, :message, :text
    add_column :items, :price_non_tax, :integer
    add_column :items, :is_active, :boolean, null: false, default: true
  end
end
