class Dashboard::CommentsController < Dashboard::BaseController
  before_action :set_dashboard_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_blog

  # GET /dashboard/comments
  # GET /dashboard/comments.json
  def index
    @dashboard_comments = Comment.all
  end

  # GET /dashboard/comments/1
  # GET /dashboard/comments/1.json
  def show
  end

  # GET /dashboard/comments/new
  def new
    @dashboard_comment = Dashboard::Comment.new
  end

  # GET /dashboard/comments/1/edit
  def edit
  end

  # POST /dashboard/comments
  # POST /dashboard/comments.json
  def create
    @dashboard_comment = Dashboard::Comment.new(dashboard_comment_params)

    respond_to do |format|
      if @dashboard_comment.save
        format.html { redirect_to @dashboard_comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard_comment }
      else
        format.html { render :new }
        format.json { render json: @dashboard_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/comments/1
  # PATCH/PUT /dashboard/comments/1.json
  def update
    respond_to do |format|
      if @dashboard_comment.update(dashboard_comment_params)
        format.html { redirect_to @dashboard_comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard_comment }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/comments/1
  # DELETE /dashboard/comments/1.json
  def destroy
    @dashboard_comment.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_comment
      @dashboard_comment = Dashboard::Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_comment_params
      params[:dashboard_comment]
    end
end
