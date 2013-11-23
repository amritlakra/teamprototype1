class FaceBookGroupFeed
  attr_accessor  :postedBy, :groupName, :postMessage, :postType, :postedAt,

  def initialize(fbHash)
  		postedBy=fbHash.from.name
  		groupName=fbHash.to.data.fetch(0,'could not find group name').name
  		postMessage=fbHash.message
  		postType=fbHash.type
  		postedAt=Time.at(fbHash.created_time)
  end
  
end