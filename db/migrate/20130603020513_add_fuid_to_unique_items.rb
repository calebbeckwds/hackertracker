class AddFuidToUniqueItems < ActiveRecord::Migration
  def change
    add_column :unique_items, :fuid, :string
    add_index :unique_items, :fuid
  end
end
