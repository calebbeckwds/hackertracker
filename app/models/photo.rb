class Photo < ActiveRecord::Base
  attr_accessible :blah, :fuid

  belongs_to :user
  belongs_to :unique_item, :foreign_key => :fuid
end
