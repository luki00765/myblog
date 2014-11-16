class Dashboard::BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout 'dashboard_blog'

  def set_blog
      @blog = Blog.find_by(subdomain: request.subdomains.first, user_id: current_user)
      raise ActionController::RoutingError.new('Not Found') if @blog.nil?
    end
end

