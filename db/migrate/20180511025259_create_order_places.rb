class CreateOrderPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :order_places do |t|
      t.references :order, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
