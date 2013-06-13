class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.integer :fuid
      t.integer :user_id
      t.attachment :photo

      t.timestamps
    end
  end

  
end
