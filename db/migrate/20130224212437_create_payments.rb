class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :type
      t.string :email
      t.string :transactionid
      t.datetime :transaction_time
      t.string :status
      t.decimal :amount
      t.string :currencycode
      t.decimal :feeamt
      t.decimal :netamt
      t.string :name
      t.boolean :dues, default: false

      t.timestamps
    end
  end
end
