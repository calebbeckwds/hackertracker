class CreateUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :handle, :string
    add_column :users, :release_authorization, :string
    add_column :users, :paypal_email, :string
    add_column :users, :keycard_number, :string
    add_column :users, :birthday, :date
    add_column :users, :phone_number, :string
    add_column :users, :mailing_address, :string
    add_column :users, :sponsor_1_name, :string
    add_column :users, :sponsor_2_name, :string
    add_column :users, :level, :string
    add_column :users, :date_of_form, :date
    add_column :users, :date_joined, :date
    add_column :users, :ec_name, :string
    add_column :users, :ec_relation, :string
    add_column :users, :ec_home, :string
    add_column :users, :ec_cell, :string
    add_column :users, :ec_second_name, :string
    add_column :users, :ec_second_relation, :string
    add_column :users, :ec_second_home, :string
    add_column :users, :ec_second_cell, :string
    add_column :users, :ec_allergies, :string
    add_column :users, :role, :string
  end

  def down
    remove_column :users, :name
    remove_column :users, :handle
    remove_column :users, :release_authorization
    remove_column :users, :paypal_email
    remove_column :users, :keycard_number
    remove_column :users, :birthday
    remove_column :users, :phone_number
    remove_column :users, :mailing_address
    remove_column :users, :sponsor_1_name
    remove_column :users, :sponsor_2_name
    remove_column :users, :level
    remove_column :users, :date_of_form
    remove_column :users, :date_joined
    remove_column :users, :ec_name
    remove_column :users, :ec_relation
    remove_column :users, :ec_home
    remove_column :users, :ec_cell
    remove_column :users, :ec_second_name
    remove_column :users, :ec_second_relation
    remove_column :users, :ec_second_home
    remove_column :users, :ec_second_cell
    remove_column :users, :ec_allergies
    remove_column :users, :role
  end
end
