class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @like = Like.new
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
