class AddPhotoAttachmentToAreas < ActiveRecord::Migration
  def self.up
    remove_column :areas, :photo
    add_attachment :areas, :photo
  end

  def self.down
    remove_attachment :areas, :photo
    add_column :areas, :photo, :string
  end

end
