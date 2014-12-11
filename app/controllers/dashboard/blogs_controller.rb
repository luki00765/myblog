class Dashboard::BlogsController < Dashboard::BaseController
  before_action :authenticate_user!
  before_action :set_blog
  layout :set_layout

  def index
    @blogs = Blog.where user: current_user
  end

  def show
  end

  def new
    @blog = Blog.new
    @blog.template_color = '#1471a3'
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        format.html { redirect_to dashboard_blogs_path(alias: @blog.alias), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to dashboard_customise_blog_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
  end

  private
  
  def set_layout
    if ['index', 'new'].include?(action_name)
      'application'
    else
      'dashboard'
    end
  end

  def blog_params
    params.require(:blog).permit(:name, :alias, :template_color)
  end
end
