class Dashboard::BlogsController < Dashboard::BaseController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.where user: current_user
    render layout: 'dashboard'
  end

  def show
    #render 'admin_show' if current_user
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        format.html { redirect_to dashboard_blogs_path, notice: 'Blog was successfully created.' }
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

  def blog_params
    params.require(:blog).permit(:name, :subdomain, :template_color)
  end
end
