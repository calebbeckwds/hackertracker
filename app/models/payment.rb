class Payment < ActiveRecord::Base
  attr_accessible :amount, :currencycode, :email, :feeamt, :name, 
    :netamt, :status, :transactionid, :transaction_type, :user_id, 
    :transaction_time

  belongs_to :user

  validates_uniqueness_of :transactionid
  validates_presence_of :name, :email, :transaction_type, :transactionid, :amount, :status, :transaction_time

  before_create :check_if_membership_dues
  before_create :associate_user_by_paypal_email

  scope :dues, where(dues: true)
  scope :latest, order(transaction_time: 'desc')
  scope :unassociated, where(user_id: nil)
  scope :recurring, where(transaction_type: 'Recurring Payment')

  def check_if_membership_dues
    if [ 'Payment', 'Recurring Payment' ].include?(self.transaction_type) and [ 20, 50, 100 ].include?(self.amount)
      self.dues = true
    end
  end

  def associate_user_by_paypal_email
    self.user = User.find_by_paypal_email(self.email.downcase)
  end
end
