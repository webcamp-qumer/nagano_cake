class AddColumnsToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :name, :string
  end
end
