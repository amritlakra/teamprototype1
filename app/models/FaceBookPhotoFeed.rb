class FaceBookPhotoFeed < FaceBookGroupFeed
  attr_accessor  :photoThubmNail,:photoName,:photoLink,:photoCaption,:byName,:byText,:byLink
  def initialize(fbHash)
  	photoThubmnail=fbHash.picture
  	photoLink=fbHash.link 
  	photoName=fbHash.name 
  	photoCaption=fbHash.caption
  	if(nil!=fbHash.properties.fetch(0))
  		byName=fbHash.properties.fetch(0).name
  		byText=fbHash.properties.fetch(0).text 
  		byLink=fbHash.properties.fetch(0).href 
  	else
  		byName=''	
  		byLink=''
  		byText=''
  	end	
  end	

end