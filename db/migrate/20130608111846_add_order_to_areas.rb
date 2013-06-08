class AddOrderToAreas < ActiveRecord::Migration
  def change
    add_column :areas, :ordering, :integer
  end
end
