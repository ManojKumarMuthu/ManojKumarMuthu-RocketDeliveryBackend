# class CreateCustomers < ActiveRecord::Migration[7.0]
#   def change
#     create_table :customers do |t|
#       t.integer :user_id,      null: false, unique: true
#       t.integer :address_id,   null: false
#       t.string :phone,         null: false
#       t.string :email
#       t.boolean :active,       null: false, default: true

#       t.timestamps
#     end
#   end
# end



class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.integer :user_id,      null: false, unique: true
      t.integer :address_id,   null: false
      t.string :phone,         null: false
      t.string :email
      t.boolean :active,       null: false, default: true

      t.timestamps
    end
    
    add_foreign_key :customers, :users
    add_foreign_key :customers, :addresses
    add_index :customers, :user_id
    add_index :customers, :address_id
    add_reference :orders, :customer, index: true, foreign_key: true
  end
end