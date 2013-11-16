class SessionsController < ApplicationController

def new 
end

def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
	session[:fb_oauth_token]=user.sectoken

	graph = Koala::Facebook::API.new(session[:fb_oauth_token])
	session[:fb_graph] = graph

	@fb_groups = (session[:fb_graph]).get_connections("me", "groups")
		
	@pg_feeds = []
    @fb_groups.each do |data|
        @pg_feeds = (session[:fb_graph]).get_connections(data['id'], "feed")
     end
	
end

def destroy
    session[:user_id] = nil
    session[:fb_oauth_token] = nil
    redirect_to root_url, notice: "Signed out!"
end

end

