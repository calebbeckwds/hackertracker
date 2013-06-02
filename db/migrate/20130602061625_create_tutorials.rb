class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.integer :fuid
      t.integer :user_id
      t.text :body
      t.text :url

      t.timestamps
    end
  end
end
