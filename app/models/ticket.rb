class Ticket < ActiveRecord::Base
  attr_accessible :body, :fuid, :status, :user_id, :user, :fuid, :unique_item, :ticket_type
  
  belongs_to :unique_item, :foreign_key => :fuid
  belongs_to :user
  
  enum_attr :ticket_type, [ :bug, :feature, :suggestion ]

  validates_presence_of :fuid, :body

  scope :active, where(status: true)
  scope :inactive, where(status: false)
  
  scope :bugs, where(ticket_type: :bug)
  scope :features, where(ticket_type: :feature)
  scope :suggestions, where(ticket_type: :suggestion)

  
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
