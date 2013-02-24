require 'cgi'
require 'yaml'

require 'httparty'

class PaypalChecker
  include HTTParty
  base_uri 'https://api-3t.paypal.com/nvp'

  def initialize(u, p, s)
    @auth = { user: u, pass: p, sig: s }
  end

  def transaction_search(opts={})
    resp = self.post 'TransactionSearch', opts
    
    # split up into transaction records
    records = []
    numrecords = resp.count { |k,v| /\AL_STATUS/.match(k) }
    (0..numrecords).each do |i|
      begin
        records[i] = HashObject[{
          timestamp: Time.parse(resp["L_TIMESTAMP#{i}"].gsub(/Z$/, " "+resp["L_TIMEZONE#{i}"])),
          type: resp["L_TYPE#{i}"],
          email: resp["L_EMAIL#{i}"],
          name: resp["L_NAME#{i}"],
          transactionid: resp["L_TRANSACTIONID#{i}"],
          status: resp["L_STATUS#{i}"],
          amt: resp["L_AMT#{i}"].to_f,
          currencycode: resp["L_CURRENCYCODE#{i}"],
          feeamt: resp["L_FEEAMT#{i}"].to_f,
          netamt: resp["L_NETAMT#{i}"].to_f
        }]
      rescue
        puts "ERROR AT RECORD #{i}"
      end
    end
    records
  end

  def post(method, opts)
    # stringify and upcase the opt's keys
    bodyopts = Hash[opts.collect {|k,v| [k.to_s.upcase,v] }]

    # do some defaults
    bodyopts['USER'] ||= @auth[:user]
    bodyopts['PWD'] ||= @auth[:pass]
    bodyopts['VERSION'] ||= '51.0'
    bodyopts['SIGNATURE'] ||= @auth[:sig]
    bodyopts['METHOD'] ||= method.to_s

    resp = self.class.post '', { body: bodyopts }
    resp = resp.body
    Hash[ resp.split("&").collect { |z| z=z.split('='); [ z[0], CGI::unescape(z[1]) ] } ]
  end

  class HashObject < Hash
    def method_missing(method, *opts)
      m = method.to_s
      return self[m] if self.has_key?(m)
      return self[m.to_sym] if self.has_key?(m.to_sym)
      super
    end
  end
end

