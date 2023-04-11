class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street_address, null: false
      t.string :city,           null: false
      t.string :postal_code,    null: false

      t.timestamps
    end

    add_reference :employees, :address, foreign_key: true
    add_reference :customers, :address, foreign_key: true
    add_reference :restaurants, :address, foreign_key: true
    add_reference :products, :restaurant, foreign_key: true
    add_reference :orders, :restaurant, foreign_key: true
    add_reference :orders, :customer, foreign_key: true
    add_reference :orders, :order_status, foreign_key: true
  end
end