# class CreateOrders < ActiveRecord::Migration[7.0]
#   def change
#     create_table :orders do |t|
#       t.integer :restaurant_id,       null: false
#       t.integer :customer_id,         null: false
#       t.integer :order_status_id,     null: false
#       t.integer :restaurant_rating

#       t.timestamps
#     end
#   end
# end



class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :order_status, null: false, foreign_key: true
      t.integer :restaurant_rating

      t.timestamps
    end

    add_index :orders, [:restaurant_id, :created_at]
    add_index :orders, [:customer_id, :created_at]
  end
end