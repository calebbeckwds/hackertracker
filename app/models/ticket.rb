class Ticket < ActiveRecord::Base
  attr_accessible :body, :fuid, :status, :user_id, :user, :fuid, :unique_item
  belongs_to :unique_item, :foreign_key => :fuid
  belongs_to :user
  validates_presence_of :fuid, :body
end
