class Setting < ActiveRecord::Base
  attr_accessible :paypal_pass, :paypal_signature, :paypal_user
end
