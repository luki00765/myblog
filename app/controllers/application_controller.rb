class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'application'
  
  helper_method :display_archives
  
  def display_archives(posts)
    posts.map { |p| p.published_at.strftime("%B %Y") }.uniq
  end
  
  def set_blog
    
  end
end
