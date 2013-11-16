class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

  def fb_groups
    @fb_groups = session[:fb_graph].get_connections("me", "groups")
  end

  def pg_feeds
    @pg_feeds = []
    @fb_groups.each do |data|
      @pg_feeds = session[:fb_graph].get_connections(data['id'], "feed")
    end
  end
  
  helper_method :current_user
  helper_method :fb_groups
  helper_method :pg_feeds
end
