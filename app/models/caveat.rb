class Caveat < ActiveRecord::Base
  attr_accessible :body, :fuid, :user_id, :user, :fuid, :unique_item
  belongs_to :unique_item, :foreign_key => :fuid
  belongs_to :user
  validates_presence_of :fuid, :body

  after_save :touch_unique_item
  def touch_unique_item
  	self.unique_item.touch
  end
end
