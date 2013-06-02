class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :fuid
      t.integer :user_id
      t.boolean :status
      t.text :body

      t.timestamps
    end
  end
end
