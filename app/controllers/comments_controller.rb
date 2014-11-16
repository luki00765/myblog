class CommentsController < ApplicationController
  before_action :set_blog

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    puts @comment.inspect
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, notice: 'Not work'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
