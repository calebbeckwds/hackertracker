class Tutorial < ActiveRecord::Base
  attr_accessible :body, :fuid, :url, :user_id, :user
  belongs_to :unique_item, :foreign_key => :fuid
  belongs_to :user
  validates_presence_of :fuid

  #before_save :get_oembed_if_possible
  after_save :touch_unique_item


  def touch_unique_item
  	self.unique_item.touch
  end

  # TODO: figure out how to get this to work well. it pulls an embed for us, but its not very nice. 
  def get_oembed_if_possible
    return if url.blank? # drop out if we dont even have a url to test

    embedly_api = Embedly::API.new :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = embedly_api.oembed :url => url

    return if obj.length < 1
    obj=obj.first

    # TODO: use obj.title for the title once we have titles
    self.body = obj.html
  end
end
