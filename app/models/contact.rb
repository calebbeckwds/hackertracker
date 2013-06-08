class Contact < ActiveRecord::Base
  attr_accessible :email, :fuid, :handle, :name, :phone, :user, :fuid, :unique_item
  belongs_to :unique_item, :foreign_key => :fuid
  validates_presence_of :fuid, :name

  after_save :touch_unique_item
  def touch_unique_item
  	self.unique_item.touch
  end
end
