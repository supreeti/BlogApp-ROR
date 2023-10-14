class LikesController < ApplicationController
  before_action :current_user

  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user_id: current_user.id, post_id: @post.id)
    @like.post = @post
    @like.user = current_user

    if @like.save
      flash[:notice] = 'Like was successfully done.'
      redirect_to '/'
    else
      flash.now[:error] = 'Oops, try again'
      render :new
    end
  end
end
