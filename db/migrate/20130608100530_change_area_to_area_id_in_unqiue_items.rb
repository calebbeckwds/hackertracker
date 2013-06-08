class ChangeAreaToAreaIdInUnqiueItems < ActiveRecord::Migration
  def up
    remove_column :unique_items, :area
    add_column :unique_items, :area_id, :integer
  end

  def down
    add_column :unique_items, :area, :string
    remove_column :unique_items, :area_id
  end
end
