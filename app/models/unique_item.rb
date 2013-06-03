class UniqueItem < ActiveRecord::Base
  attr_accessible :area, :loggable, :name, :photo, :ticketable, :fuid

  has_many :logs, :foreign_key => :fuid
  has_many :contacts, :foreign_key => :fuid
  has_many :caveats, :foreign_key => :fuid
  has_many :tutorials, :foreign_key => :fuid
  has_many :tickets, :foreign_key => :fuid

  validates_presence_of :name, :area

  has_attached_file :photo, :styles => {
    :medium => '300x300>', 
    :thumb => '100x100>'
  }

  def needs_work?
    tickets.where(status: true).length > 0
  end

  def ticketable?
  	!!ticketable
  end
  def loggable?
  	!!loggable
  end
end
