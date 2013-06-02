class CreateCaveats < ActiveRecord::Migration
  def change
    create_table :caveats do |t|
      t.integer :fuid
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
