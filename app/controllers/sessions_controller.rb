class SessionsController < ApplicationController

def new 
end

def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
	session[:token]=getToken(env["omniauth.auth"])
    redirect_to root_url, notice: "Signed in! by"+user.provider
end

def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
end

private def getToken(auth)
auth["credentials"]["token "]
end

end

