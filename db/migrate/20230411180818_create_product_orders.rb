class CreateProductOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :product_orders do |t|
      t.integer :product_id,             null: false
      t.integer :order_id,               null: false
      t.integer :product_quantity,       null: false, check: 'product_quantity > 0'
      t.integer :product_unit_cost,      null: false, check: 'product_unit_cost >= 0'

      t.timestamps
    end
  end
end
