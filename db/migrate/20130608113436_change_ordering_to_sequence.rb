class ChangeOrderingToSequence < ActiveRecord::Migration
  def up
    remove_column :areas, :ordering
    add_column :areas, :sequence, :integer
  end

  def down
    add_column :areas, :ordering, :integer
    remove_column :areas, :sequence
  end
end
