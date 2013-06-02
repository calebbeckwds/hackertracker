class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :fuid
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
