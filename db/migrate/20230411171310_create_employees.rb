# class CreateEmployees < ActiveRecord::Migration[7.0]
#   def change
#     create_table :employees do |t|
#       t.integer :user_id,    null: false, unique: true
#       t.integer :address_id, null: false
#       t.string :phone,       null: false
#       t.string :email

#       t.timestamps
#     end
#   end
# end


class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.integer :user_id,    null: false, unique: true
      t.integer :address_id, null: false
      t.string :phone,       null: false
      t.string :email

      t.timestamps
    end

    add_foreign_key :employees, :users, column: :user_id
    add_foreign_key :employees, :addresses, column: :address_id

    add_reference :orders, :employee, foreign_key: { to_table: :employees }
  end
end