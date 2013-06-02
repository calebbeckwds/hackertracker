class Contact < ActiveRecord::Base
  attr_accessible :email, :fuid, :handle, :name, :phone
end
