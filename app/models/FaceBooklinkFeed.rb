class FaceBookLinkFeed < FaceBookGroupFeed
  attr_accessor  :feedLink,:feedCaption,:feedName,:feedDescription
  def initialize(fbHash)
  	super(fbHash)
  	feedLink=fbHash.link 
  	feedCaption=fbHash.caption
  	feedName=fbHash.name 
  	feedDescription=fbHash.description
  end	
end