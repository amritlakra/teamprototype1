class SessionsController < ApplicationController

def new 
end

def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
	session[:fb_oauth_token]=user.sectoken
	graph = Koala::Facebook::API.new(session[:fb_oauth_token])
	@fb_groups = graph.get_connections("me", "groups")
	redirect_to root_url, notice: "Signed in! by"+user.provider
end

def destroy
    session[:user_id] = nil
    session[:fb_oauth_token] = nil
    redirect_to root_url, notice: "Signed out!"
end

end

