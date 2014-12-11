class Dashboard::BaseController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'dashboard'

  def set_blog
    @blog = Blog.find_by_alias(params[:alias])
  end
end
