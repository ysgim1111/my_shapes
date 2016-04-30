class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :category
      t.string :name
      t.integer :price
      t.text :desc

      t.timestamps null: false
    end
  end
end
