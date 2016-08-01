class CreateDesinations < ActiveRecord::Migration
  def change
    create_table :desinations do |t|
      t.belongs_to :user, index: true
      t.string :receiver, null: false
      t.integer :postcode, null: false
      t.string :address_number
      t.string :address_number_other
      t.string :address_road
      t.string :address_road_other
      t.string :phone_number, null: false
      t.string :tel 
      t.timestamps null: false
    end
  end
end
