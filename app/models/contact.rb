class Contact < ActiveRecord::Base
  attr_accessible :email, :fuid, :handle, :name, :phone
  belongs_to :unique_item, :foreign_key => :fuid
  validates_presence_of :fuid, :name
end
