class Ticket < ActiveRecord::Base
  attr_accessible :body, :fuid, :status, :user_id, :user, :fuid, :unique_item
  belongs_to :unique_item, :foreign_key => :fuid
  belongs_to :user
  validates_presence_of :fuid, :body

  scope :active, where(status: true)
  scope :inactive, where(status: false)

  after_save :touch_unique_item
  def touch_unique_item
    self.unique_item.touch
  end

  def active?
  	!!status
  end

  def inactive?
  	!status
  end
end
