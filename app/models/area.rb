class Area < ActiveRecord::Base
  attr_accessible :desc, :name, :photo, :sequence

  has_many :unique_items
  has_many :tickets, :through => :unique_items
  has_many :photos, :through => :unique_items
  has_many :tutorials, :through => :unique_items

  validates_uniqueness_of :name
  
  has_attached_file :photo, :styles => {
    :large => '900x900>',
    :medium => '300x300>', 
    :thumb => '100x100>'
  }

  def needs_work?
    tickets.where(status: true).length > 0
  end
end
