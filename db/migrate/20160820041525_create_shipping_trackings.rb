class CreateShippingTrackings < ActiveRecord::Migration
  def change
    create_table :shipping_trackings do |t|
      t.references :trackable, polymorphic: true, index: true, null: false
      t.string :number
      t.integer :shipping_type
      t.integer :shipping_company
      t.datetime :shipping_date

      t.timestamps null: false
    end
  end
end
