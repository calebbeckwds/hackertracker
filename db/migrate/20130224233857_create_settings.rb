class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :paypal_user
      t.string :paypal_pass
      t.string :paypal_signature

      t.timestamps
    end
  end
end
