class UniqueItem < ActiveRecord::Base
  attr_accessible :area, :loggable, :name, :photo, :ticketable, :fuid

  has_many :logs, :foreign_key => :fuid
  has_many :contacts, :foreign_key => :fuid
  has_many :caveats, :foreign_key => :fuid
  has_many :tutorials, :foreign_key => :fuid
  has_many :tickets, :foreign_key => :fuid

  validates_presence_of :name, :area
  validates_uniqueness_of :name

  has_attached_file :photo, :styles => {
    :large => '900x900>',
    :medium => '300x300>', 
    :thumb => '100x100>'
  }

  searchable do
    text :name
    boolean :loggable
    boolean :ticketable
    text :area
    text :logs do
      logs.collect(&:body).join(' ')      
    end
    text :tickets do
      tickets.collect(&:body).join(' ') 
    end
    text :caveats do
      caveats.collect(&:body).join(' ')
    end
    text :tutorials do
      tutorials.collect(&:body).join(' ')
    end
    text :contacts  do
      contacts.collect { |c| [c.phone,c.email,c.name,c.handle].join(' ') }
    end
  end

  def needs_work?
    tickets.where(status: true).length > 0
  end

  def ticketable?
  	!!ticketable
  end

  def loggable?
  	!!loggable
  end

  def semantic_attr(attr)
    @neighbors ||= UniqueItem.search do
      # allmytexts = [ name, area ] + logs.collect(&:body) + tickets.collect(&:body) +
      #     caveats.collect(&:body) + tutorials.collect(&:body) + 
      #     contacts.collect { |c| [c.phone,c.email,c.name,c.handle].join(' ') }
      # fulltext allmytexts.join(' ')
      fulltext area
    end.results
    send(attr) + @neighbors.collect(&attr).flatten.uniq
  end

  def semantic_logs; semantic_attr :logs; end
  def semantic_contacts; semantic_attr :contacts; end
  def semantic_caveats; semantic_attr :caveats; end
  def semantic_tutorials; semantic_attr :tutorials; end
  def semantic_tickets; semantic_attr :tickets; end

  def as_json(options=nil)
    super(options).merge!({
      semantic_logs: semantic_logs,
      semantic_contacts: semantic_contacts,
      semantic_caveats: semantic_caveats,
      semantic_tutorials: semantic_tutorials,
      semantic_tickets: semantic_tickets
    })
  end

end
