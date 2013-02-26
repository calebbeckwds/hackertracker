require 'paypal'

namespace :payments do
  desc "Get payment records from Paypal"
  task :paypal => :environment do 
    settings = Setting.first
    paypal = Paypal.new settings.paypal_user, settings.paypal_pass, settings.paypal_signature

    tomorrow = (Time.now+1.days).strftime('%Y-%m-%dT23:59:59Z')
    yesterday = (Time.now-1.days).strftime('%Y-%m-%dT00:00:00Z')

    transactions = paypal.transaction_search startdate: yesterday, enddate: tomorrow

    transactions.each do |t|
        Payment.find_or_create_by_transactionid transaction_type: t.type, 
            email: t.email, transactionid: t.transactionid,
            transaction_time: t.timestamp, status: t.status, amount: t.amt,
            currencycode: t.currencycode, feeamt: t.feeamt, netamt: t.netamt,
            name: t.name
    end

    print transactions.to_yaml
  end

  desc "Get a month's worth of payment records from Paypal"
  task :paypal_month => :environment do
    settings = Setting.first
    paypal = Paypal.new settings.paypal_user, settings.paypal_pass, settings.paypal_signature

    tomorrow = (Time.now+1.days).strftime('%Y-%m-%dT23:59:59Z')
    yesterday = (Time.now-30.days).strftime('%Y-%m-%dT00:00:00Z')

    transactions = paypal.transaction_search startdate: yesterday, enddate: tomorrow

    transactions.each do |t|
        Payment.find_or_create_by_transactionid transaction_type: t.type, 
            email: t.email, transactionid: t.transactionid,
            transaction_time: t.timestamp, status: t.status, amount: t.amt,
            currencycode: t.currencycode, feeamt: t.feeamt, netamt: t.netamt,
            name: t.name
    end

    print transactions.to_yaml
  end

  desc "Try to associate payments with members for payments that dont have members yet"
  task :paypal_associate_members do
    Payment.unassociated.each &:associate_user_by_paypal_email
  end
end
