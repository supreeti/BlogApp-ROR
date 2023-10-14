class CommentsController < ApplicationController
  before_action :set_post
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Comment was successfully done.'
      redirect_to '/'
    else
      flash.now[:error] = 'Oops, try again'
      render :new
    end
  end

    private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
