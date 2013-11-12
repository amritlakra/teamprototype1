class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	
  end

  def fb_groups
  	graph = Koala::Facebook::API.new(session[:fb_oauth_token])
	@fb_groups = graph.get_connections("me", "groups")
  end
  helper_method :current_user
  helper_method :fb_groups
end
