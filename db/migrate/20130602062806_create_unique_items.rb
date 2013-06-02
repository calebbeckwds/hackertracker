class CreateUniqueItems < ActiveRecord::Migration
  def change
    create_table :unique_items do |t|
      t.boolean :loggable
      t.boolean :ticketable
      t.string :area
      t.string :name
      t.string :photo

      t.timestamps
    end
  end
end
