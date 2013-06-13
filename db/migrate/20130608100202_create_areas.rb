class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.text :desc
      t.string :photo

      t.timestamps
    end
  end
end