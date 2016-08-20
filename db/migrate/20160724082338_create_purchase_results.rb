class CreatePurchaseResults < ActiveRecord::Migration
  def change
    create_table :purchase_results do |t|
      t.belongs_to :purchase_list, index: true
      t.string :imp_uid
      t.string :pay_method
      t.string :merchant_uid
      t.string :name
      t.integer :paid_amount
      t.string :pg_provider
      t.string :pg_tid
      t.string :apply_num
      t.string :vbank_num
      t.string :vbank_name
      t.string :vbank_holder
      t.string :vbank_date
      t.string :buyer_name
      t.string :buyer_email
      t.string :buyer_tel
      t.string :buyer_addr
      t.string :buyer_postcode
      t.text :custom_data
      t.string :status
      t.timestamp :paid_at
      t.string :receipt_url

      t.timestamps null: false
    end
  end
end
