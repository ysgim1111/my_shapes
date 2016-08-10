class DropTableToInfluenceProducts < ActiveRecord::Migration
  def up
    drop_table :influence_products
  end

  def down
    create_table :influence_products do |t|
      t.belongs_to :influence, index: true
      t.belongs_to :product, index: true
      t.timestamps null: false
    end
  end
end
