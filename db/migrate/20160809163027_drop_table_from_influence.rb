class DropTableFromInfluence < ActiveRecord::Migration
  def up
    drop_table :influences
  end

  def down
    create_table :influences do |t|
      t.string :name, null: false
      t.string :desc
      t.integer :selling_point, default: 0
      t.integer :user_point, default: 0

      t.timestamps null: false
    end
  end
end
