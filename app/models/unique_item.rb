class UniqueItem < ActiveRecord::Base
  attr_accessible :area, :loggable, :name, :photo, :ticketable

  has_many :logs, :foreign_key => :fuid
  has_many :contacts, :foreign_key => :fuid
  has_many :caveats, :foreign_key => :fuid
  has_many :tutorials, :foreign_key => :fuid
  has_many :tickets, :foreign_key => :fuid

  validates_presence_of :name, :area

  def ticketable?
  	!!ticketable
  end
  def loggable?
  	!!loggable
  end
end
