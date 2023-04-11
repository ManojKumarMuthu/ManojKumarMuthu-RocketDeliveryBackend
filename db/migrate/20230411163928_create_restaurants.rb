# class CreateRestaurants < ActiveRecord::Migration[7.0]
#   def change
#     create_table :restaurants do |t|
#       t.integer :user_id,         null: false
#       t.integer :address_id,      null: false, unique: true
#       t.string :phone,            null: false
#       t.string :email
#       t.string :name,             null: false
#       t.integer :price_range,     null: false, default: 1
#       t.boolean :active,          null: false, default: true

#       t.timestamps
#     end
#   end
# end



class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.integer :user_id,         null: false
      t.integer :address_id,      null: false
      t.string :phone,            null: false
      t.string :email
      t.string :name,             null: false
      t.integer :price_range,     null: false, default: 1
      t.boolean :active,          null: false, default: true

      t.timestamps
    end
    
    add_foreign_key :restaurants, :users
    add_foreign_key :restaurants, :addresses
    add_index :restaurants, [:user_id, :address_id], unique: true
    has_many :products, dependent: :destroy
    has_many :orders, dependent: :destroy
  end
end