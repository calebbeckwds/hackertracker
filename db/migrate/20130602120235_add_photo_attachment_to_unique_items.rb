class AddPhotoAttachmentToUniqueItems < ActiveRecord::Migration
  def self.up
    remove_column :unique_items, :photo
    add_attachment :unique_items, :photo
  end

  def self.down
    remove_attachment :unique_items, :photo
    add_column :unique_items, :photo, :string
  end
end
