class Ticket < ActiveRecord::Base
  attr_accessible :body, :fuid, :status, :user_id
end
