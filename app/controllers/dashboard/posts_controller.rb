class Dashboard::PostsController < Dashboard::BaseController
  before_action :authenticate_user!, except: [:index, :archives, :only]
  before_action :set_blog
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = @blog.posts
  end

  def archives
    date = DateTime.parse(params[:date])
    @posts = @blog.posts.where('published_at BETWEEN ? AND ?', date.beginning_of_day, date.end_of_month).all
    render :index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.blog_id = @blog.id

    puts post_params
    puts @post.inspect

    respond_to do |format|
      if @post.save
        format.html { redirect_to dashboard_blog_posts_path(alias: @blog.alias), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to dashboard_blog_posts_path(alias: @blog.alias), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_blog
    @blog = Blog.find_by_alias(params[:alias])    
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :published_at)
  end
end
