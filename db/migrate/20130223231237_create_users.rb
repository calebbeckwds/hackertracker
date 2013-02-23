class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :handle
      t.string :release_authorization
      t.string :paypal_email
      t.string :keycard_number
      t.date :birthday
      t.string :phone_number
      t.string :mailing_address
      t.string :sponsor_1_name
      t.string :sponsor_2_name
      t.string :level
      t.date :date_of_form
      t.date :date_joined
      t.string :ec_name
      t.string :ec_relation
      t.string :ec_home
      t.string :ec_cell
      t.string :ec_second_name
      t.string :ec_second_relation
      t.string :ec_second_home
      t.string :ec_second_cell
      t.string :ec_allergies

      t.timestamps
    end
  end
end
