class CreateProductOptions < ActiveRecord::Migration
  def change
    create_table :product_options do |t|
      t.belongs_to :product, index: true
      t.string :name
      t.integer :order
      t.timestamps null: false
    end
  end
end
