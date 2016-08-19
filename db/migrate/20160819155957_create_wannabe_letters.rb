class CreateWannabeLetters < ActiveRecord::Migration
  def change
    create_table :wannabe_letters do |t|
      t.references :purchase_list, index: true, null: false, default: 0
      t.references :influencer_store, index: true, null: false, default: 0
      t.string :content, null: false, default: ""
      t.text :reply
      t.integer :status, null: false, default: 0
      t.datetime :until_reply_date

      t.timestamps null: false
    end
  end
end
