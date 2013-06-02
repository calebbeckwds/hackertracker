class Ticket < ActiveRecord::Base
  attr_accessible :body, :fuid, :status, :user_id
  belongs_to :unique_item, :foreign_key => :fuid
  validates_presence_of :fuid, :body
end
