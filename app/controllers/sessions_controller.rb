class SessionsController < ApplicationController

def new 
end

def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
	session[:fb_oauth_token]=user.sectoken

	graph = Koala::Facebook::API.new(session[:fb_oauth_token])
	session[:fb_graph] = graph
   
    @pg_feeds =getFaceBookFeeds(graph,graph.get_connections("me", "groups"))
end



def getFaceBookFeeds(graph,fb_groups)
    pg_feeds = []
    fb_groups.each do |data|
        pg_feed = graph.get_connections(data['id'], "feed")
        if nil!=pg_feed
            pg_feed.each do |feed_data|
                if "photo"==feed_data['type']
                   feed=FaceBookPhotoFeed.new(pg_feed)
                elsif "link"==feed_data['type']
                    feed=FaceBookLinkFeed.new(pg_feed)
                else
                    feed=FaceBookStatusFeed.new(pg_feed)
                end
                pg_feeds<<feed
            end  
        end
    end
    pg_feeds
end

def destroy
    session[:user_id] = nil
    session[:fb_oauth_token] = nil
    redirect_to root_url, notice: "Signed out!"
end

end

