class CreateOrderShows < ActiveRecord::Migration[6.1]
  def change
    create_table :order_shows do |t|

      t.timestamps
    end
  end
end
