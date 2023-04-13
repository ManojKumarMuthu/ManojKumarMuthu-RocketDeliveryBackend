class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :restaurant_id,       null: false
      t.integer :customer_id,         null: false
      t.integer :order_status_id,     null: false
      t.integer :restaurant_rating,   null: false, min: 1, max: 5
      t.integer :courier_id     

      t.timestamps                    null: false
    end
    add_foreign_key :orders, :restaurants, column: :restaurant_id, primary_key: "id"
    add_foreign_key :orders, :customers, column: :customer_id, primary_key: "id"
    add_foreign_key :orders, :order_statuses, column: :order_status_id, primary_key: "id"
    add_foreign_key :orders, :couriers, column: :courier_id, primary_key: "id", null: true
  end
end