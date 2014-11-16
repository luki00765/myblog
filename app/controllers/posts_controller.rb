class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog
  layout 'blog'

  def index
    @posts = @blog.posts
  end

  def archives
    date = DateTime.parse(params[:date])
    @posts = @blog.posts.where('published_at BETWEEN ? AND ?', date.beginning_of_day, date.end_of_month).all
    render :index
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :published)
    end
end
