class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
            :birthday, :date_joined, :date_of_form, :ec_allergies, :ec_cell, 
            :ec_home, :ec_name, :ec_relation, :ec_second_cell, 
            :ec_second_home, :ec_second_name, :ec_second_relation, :handle, 
            :keycard_number, :level, :mailing_address, :name, :paypal_email, 
            :phone_number, :release_authorization, :sponsor_1_name, 
            :sponsor_2_name

  has_many :payments

  after_create :associate_payments

  def admin?
    role == "admin"
  end

  def set_admin(val)
    self.admin = val
  end

  def associate_payments
    Payment.unassociated.recurring.each do |p|
      if p.email.downcase == self.paypal_email.downcase
        p.user = self
        p.save
      end
    end
  end

  def latest_payment
    self.payments.order(:transaction_time).last
  end
end
