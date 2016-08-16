class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.references :user, index: true, null: false
      t.string :name, null: false
      t.string :receiver, null: false
      t.integer :zonecode, null: false, limit: 5
      t.string :address, null: false
      t.string :address_detail
      t.string :address_type, limit: 1
      t.string :phone_number, null: false
      t.string :tel
      t.boolean :default, default: false
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
