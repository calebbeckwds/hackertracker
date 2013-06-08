class Tutorial < ActiveRecord::Base
  attr_accessible :body, :fuid, :url, :user_id, :user
  belongs_to :unique_item, :foreign_key => :fuid
  belongs_to :user
  validates_presence_of :fuid

  after_save :touch_unique_item
  def touch_unique_item
  	self.unique_item.touch
  end
end
