class SessionsController < ApplicationController

def new 
end

def create
    user = User.from_omniauth(env["omniauth.auth"])
    @tokhash=request.env["omniauth.auth"]
    session[:user_id] = user.id
	redirect_to root_url, notice: "Signed in! by"+user.provider
end

def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
end

end

