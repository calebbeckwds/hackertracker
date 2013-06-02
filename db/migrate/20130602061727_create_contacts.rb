class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :fuid
      t.string :phone
      t.string :email
      t.string :name
      t.string :handle

      t.timestamps
    end
  end
end
