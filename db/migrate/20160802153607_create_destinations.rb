class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.belongs_to :user, index: true
      t.string :receiver, null: false
      t.string :name, null: false
      t.integer :zonecode, null: false, limit: 5
      t.string :address, null: false
      t.string :address_detail
      t.string :address_type, limit: 1
      t.string :phone_number, null: false
      t.string :tel
      t.timestamps null: false
    end
  end
end
