# class CreateOrderStatuses < ActiveRecord::Migration[7.0]
#   def change
#     create_table :order_statuses do |t|
#       t.string :name,       null: false

#       t.timestamps
#     end
#   end
# end



class CreateOrderStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :order_statuses do |t|
      t.string :name,       null: false

      t.timestamps
    end

    # Add a foreign key to orders table
    add_reference :orders, :order_status, foreign_key: true, null: false

    # Add a has_many association to OrderStatus model
    add_column :order_statuses, :orders_count, :integer, null: false, default: 0
  end
end